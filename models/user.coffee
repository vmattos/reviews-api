
db = require 'mongoose'

findOrCreate = require 'mongoose-findorcreate'

module.exports = do ->

  UserSchema = new db.Schema
    ip: String
    id: String
    name: String
  ,versionKey: false

  UserSchema.plugin findOrCreate

  return db.model 'User', UserSchema