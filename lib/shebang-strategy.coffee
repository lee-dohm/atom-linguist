_ = require 'underscore-plus'

Languages = require './languages'

module.exports =
  employ: (blob) ->
    line = blob.getFirstLine()
    return [] unless line.match /^#!/

    Languages.findByInterpreter(@interpreter(line))

  interpreter: (line) ->
    interpreter = _.last(line.split('/'))
    if interpreter.match /^env/ then interpreter.split(/\s+/)[1] else interpreter
