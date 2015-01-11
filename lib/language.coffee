fs = require 'fs'
path = require 'path'

yaml = require 'js-yaml'

# Public: Represents a known language.
class Language
  # Public: Gets the list of all known language definitions.
  #
  # * `recordsPath` Path {String} to load the list of known languages from.
  #
  # Returns an {Object} mapping language name to language record.
  @all: (recordsPath = path.join(__dirname, '../data/languages.yml')) ->
    unless @languages
      yaml = yaml.safeLoad(fs.readFileSync(recordsPath))
      @languages = {}
      @languages[name] = new Language(lang) for name, lang of yaml

    @languages

  @findByExtension: (extension) ->
    (name for name, lang of @all() when lang.extensions? and extension in lang.extensions)

  @findByFullName: (fullName) ->
    (name for name, lang of @all() when lang.filenames? and fullName in lang.filenames)

  # Public: Creates a language from the `record` stored in `data/languages.yml`.
  #
  # * `record` {Object} record from storage.
  constructor: (record) ->
    {@extensions, @filenames} = record
    @scope = record.tm_scope

module.exports = Language
