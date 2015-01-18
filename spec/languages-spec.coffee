{getFixturePath} = require './spec-helper'

Languages = require '../lib/languages'

describe 'Languages', ->
  [languages] = []

  beforeEach ->
    languages = Languages.all(getFixturePath('mini-languages.yml'))

  describe '.all', ->
    it 'retrieves all languages', ->
      keys = Object.keys(languages)

      expect(keys.length).toBe 5
      expect(keys).toContain 'C'
      expect(keys).toContain 'C#'
      expect(keys).toContain 'C++'
      expect(keys).toContain 'CoffeeScript'
      expect(keys).toContain 'JSON'

  describe '.findByExtension', ->
    it 'gets a single candidate as an array of one element', ->
      expect(Languages.findByExtension('.cpp')).toEqual ['C++']

    it 'gets a list of candidates', ->
      expect(Languages.findByExtension('.h')).toEqual ['C', 'C++']

  describe '.findByFullName', ->
    it 'gets a list of candidates', ->
      expect(Languages.findByFileName('composer.lock')).toEqual ['JSON']
