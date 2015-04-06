
db = require 'mongoose'

module.exports = do ->

  ReviewSchema = new db.Schema
    productId: String
    title: String
    author: { type: db.Schema.ObjectId, ref: 'User' }
    created_at: { type: Date, default: Date.now }
    rating: { type: Number, min: 1, max: 5 }
    recommended: Boolean
    votes:
      upvotes: { type: Number, default: 0 }
      downvotes: { type: Number, default: 0 }
    pictures: [{ url: String, description: String  }]
    comments: [{ type: db.Schema.ObjectId, ref: 'Comments' }]
    text: String
  ,versionKey: false

  return db.model 'Review', ReviewSchema