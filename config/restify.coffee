
bodyParser = require 'body-parser'

module.exports = (server, config) ->

  middlewares = require('./middlewares')(config)

  server.use bodyParser.urlencoded({ extended: false })
  server.use bodyParser.json()
  server.use middlewares.logRequest