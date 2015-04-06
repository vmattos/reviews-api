
db = require 'mongoose'

module.exports = do ->

  CommentSchema = new db.Schema
    text: String
    author: {type: db.Schema.ObjectId, ref: 'User'}
  ,versionKey: false

  return db.model 'Comment', CommentSchema