fs = require 'fs'
yaml = require 'js-yaml'

Language = require '../lib/language'

describe 'Language', ->
  [language] = []

  beforeEach ->
    json = yaml.safeLoad(fs.readFileSync(getFixturePath('json.yml')))
    language = new Language(json.JSON)

  it 'has a list of extensions', ->
    expect(language.extensions).toEqual ['.json', '.lock']

  it 'has a list of filenames', ->
    expect(language.filenames).toEqual ['.jshintrc', 'composer.lock']

  it 'has a scope name', ->
    expect(language.scope).toEqual 'source.json'

  describe '.all', ->
    it 'retrieves all languages', ->
      languages = Language.all(getFixturePath('mini-languages.yml'))
      keys = Object.keys(languages)

      expect(keys.length).toBe 3
      expect(keys).toContain 'C'
      expect(keys).toContain 'C#'
      expect(keys).toContain 'C++'
