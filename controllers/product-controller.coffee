
_ = require 'underscore'
mongoClient = require '../libs/mongo-client'

exports.getReviews = (req, res) ->
  productId = req.params.productId

  mountReviewsObject = (reviews) ->

    console.log reviews
    totalReviews = reviews.length
    recommendations = (_.countBy reviews, (review) -> review.recommended).true
    totalRating = _.reduce(reviews, (memo, review) ->
      return memo + review.rating
    ,0)
    averageRating = parseFloat (totalRating / totalReviews).toFixed(1)
    ratingsPerGrade = _.countBy reviews, (review) -> review.rating
    return {
      productId: productId
      totalReviews: totalReviews
      recommendations: recommendations
      ratings:
        average: averageRating
        perGrade: ratingsPerGrade
      reviews: reviews
    }

  queryCriteria =
    productId: productId

  queryProjection =
    productId: false
    _id: false

  populateAuthorCriteria =
    path: 'author'
    select:
      id: 1
      name: 1
      _id: 0

  mongoClient.models.Review
  .find(queryCriteria, queryProjection)
  .populate(populateAuthorCriteria)
  .exec()
  .then mountReviewsObject
  .then (reviews) -> res.send reviews

exports.postReview = (req, res) ->
  User = mongoClient.models.User
  author = req.body.author
  User.findOrCreate author, (err, authorDoc) ->
    return console.error(err) if err
    review = new mongoClient.models.Review req.body.review
    review.author = authorDoc._id
    review.productId = req.params.productId
    review.save (err, reviewDoc) ->
      return console.error(err) if err
      console.log reviewDoc
      res.send 200