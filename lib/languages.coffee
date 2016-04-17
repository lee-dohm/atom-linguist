fs = require 'fs'
path = require 'path'

Yaml = require 'js-yaml'

module.exports =
  # Public: Gets the list of all known language definitions.
  #
  # * `recordsPath` Path {String} to load the list of known languages from.
  #
  # Returns an {Object} mapping language name to language record.
  all: (recordsPath = path.join(__dirname, '../data/languages.yml')) ->
    @languages ?= Yaml.safeLoad(fs.readFileSync(recordsPath), {json: true})

  # Public: Finds the list of language candidates from the supplied extension.
  #
  # * `extension` {String} extension to classify.
  #
  # Returns an {Array} of {String} language names.
  findByExtension: (ext) ->
    (name for name, lang of @all() when lang.extensions? and ext in lang.extensions)

  # Public: Finds the list of language candidates from the supplied file name.
  #
  # * `fileName` {String} name of the file to classify.
  #
  # Returns an {Array} of {String} language names.
  findByFileName: (fileName) ->
    (name for name, lang of @all() when lang.filenames? and fileName in lang.filenames)

  # Public: Finds the list of language candidates from the supplied interpreter name.
  #
  # * `interpreter` {String} name of the interpreter.
  #
  # Returns an {Array} of {String} language names.
  findByInterpreter: (interpreter) ->
    (name for name, lang of @all() when lang.interpreters? and interpreter in lang.interpreters)
