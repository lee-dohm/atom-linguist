# Public: Represents a known language.
class Language
  # Public: Creates a language from the `record` stored in `data/languages.yml`.
  #
  # * `record` {Object} record from storage.
  constructor: (record) ->
    {@extensions, @filenames} = record
    @scope = record.tm_scope

module.exports = Language
