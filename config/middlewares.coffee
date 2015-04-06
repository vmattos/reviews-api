
module.exports = (config) ->

  logRequest: (req, res, next) ->
    console.log req.method, req.url
    next()