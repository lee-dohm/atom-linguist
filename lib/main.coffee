_ = require 'underscore-plus'

FileBlob = require './file-blob'
FileNameStrategy = require './file-name-strategy'

module.exports =
  detect: (filePath) ->
    strategies = @strategies()
    blob = new FileBlob(filePath)
    fn = (languages, strategy) ->
      candidates = strategy.employ(blob, languages)
      switch
        when candidates.length is 1
          _.first(candidates)
        when candidates.length > 1
          candidates
        else
          languages

    strategies.reduce(fn, [])

  # Public: Gets the list of strategies to employ in determining the file type.
  #
  # Returns an {Array} of strategies.
  strategies: ->
    [FileNameStrategy]
