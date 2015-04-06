###
Module dependencies.
###

restify = require 'restify'

server = restify.createServer version: "0.0.1", name: 'reviews-api'

config =
  port: process.env.PORT or 3000
  env: process.env.NODE_ENV or 'development'

require('./config/restify')(server, config)
require('./config/routes')(server)

server.listen config.port, -> console.log "#{server.name} listening on port #{config.port}"