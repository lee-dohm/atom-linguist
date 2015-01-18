_ = require 'underscore-plus'

Languages = require './languages'

# Public: Classifies a file by the [shebang line](https://en.wikipedia.org/wiki/Shebang_(Unix)),
#         if any.
class ShebangStrategy
  # Public: Executes the strategy on the given parameters and returns the answer.
  #
  # * `blob` {FileBlob} of the file to classify.
  #
  # Returns an {Array} of {String} language names.
  @employ: (blob) ->
    line = blob.getFirstLine()
    return [] unless line.match /^#!/

    Languages.findByInterpreter(@interpreter(line))

  # Private: Determines the interpreter named on the shebang line.
  #
  # * `line` {String} containing the first line of the file.
  #
  # Returns the name {String} of the interpreter.
  @interpreter: (line) ->
    interpreter = _.last(line.split('/'))
    if interpreter.match /^env/ then interpreter.split(/\s+/)[1] else interpreter

module.exports = ShebangStrategy
