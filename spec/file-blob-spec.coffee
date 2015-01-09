FileBlob = require '../lib/file-blob'

{getFixturePath, getFixtureText} = require './spec-helper'

describe 'FileBlob', ->
  [fileBlob] = []

  beforeEach ->
    fileBlob = new FileBlob(getFixturePath('test.coffee'))

  it 'has the name of the file', ->
    expect(fileBlob.getName()).toEqual getFixturePath('test.coffee')

  it 'has the size of the file', ->
    expect(fileBlob.getSize()).toEqual 5273

  it 'can retrieve the contents of the file', ->
    expect(fileBlob.getData()).toEqual getFixtureText('test.coffee')
