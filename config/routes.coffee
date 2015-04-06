
productController = require '../controllers/product-controller'

module.exports = (server) ->

  server.post '/product/:productId', productController.postReview
  server.get '/product/:productId', productController.getReviews