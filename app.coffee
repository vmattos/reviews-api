###
Module dependencies.
###

restify = require 'restify'
pkg = require './package.json'

server = restify.createServer version: pkg.version, name: 'reviews-api'

config =
  port: process.env.PORT or 80
  env: process.env.NODE_ENV or 'development'

require('./config/restify')(server, config)
require('./config/routes')(server)

server.listen config.port, -> console.log "#{server.name} listening on port #{config.port}"