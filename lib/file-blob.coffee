fs = require 'fs'
path = require 'path'
_ = require 'underscore-plus'

# Public: Represents a file to be classified.
class FileBlob
  constructor: (@fileName) ->

  # Public: Returns the name of the file.
  getName: ->
    @fileName

  # Public: Returns the size of the file.
  getSize: ->
    fs.statSync(@fileName).size

  # Public: Returns the contents of the file.
  getData: ->
    fs.readFileSync(@fileName).toString()

  getFirstLine: ->
    @getData().split('\n')[0]

  # Public: Returns the last extension of the file.
  getExtension: ->
    _.last(@getExtensions())

  # Public: Gets the list of extensions from the file.
  #
  # There are files with one possible extension like `.coffee`, but there is also a common practice
  # in templating languages to use multiple extensions like `.html.haml`. In that case, the file
  # should be considered both a `.haml` file and an `.html.haml` file for the purposes of
  # classification.
  #
  # Returns an {Array} of extensions for the file.
  getExtensions: ->
    [basename, segments...] = path.basename(@fileName).split('.')

    _.map [0...segments.length], (index) ->
      '.' + segments[index..-1].join('.')

module.exports = FileBlob
