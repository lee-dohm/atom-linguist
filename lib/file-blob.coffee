fs = require 'fs'

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

module.exports = FileBlob
