FileBlob = require '../lib/file-blob'
FileNameStrategy = require '../lib/file-name-strategy'
Language = require '../lib/language'

{getFixturePath} = require './spec-helper'

describe 'FileNameStrategy', ->
  beforeEach ->
    languages = Language.all(getFixturePath('mini-languages.yml'))

  it 'gets a list of candidates', ->
    expect(FileNameStrategy.employ(new FileBlob('test.h'))).toEqual ['C', 'C++']

  it 'collapses duplicates', ->
    expect(FileNameStrategy.employ(new FileBlob('composer.lock'))).toEqual ['JSON']
