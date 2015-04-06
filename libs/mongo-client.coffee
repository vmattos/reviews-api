
mongoose = require 'mongoose'

Review = require '../models/review'
Comment = require '../models/comment'
User = require '../models/user'

class MongoClient

  db = null

  constructor: ->
    db = mongoose.connect process.env.MONGOLAB_URI if db is null
    @prepareModels()

  prepareModels: ->
    @models =
      Review: Review
      Comment: Comment
      User: User

module.exports = new MongoClient()
