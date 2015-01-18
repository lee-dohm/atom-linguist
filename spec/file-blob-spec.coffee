path = require 'path'

FileBlob = require '../lib/file-blob'

{getFixturePath, getFixtureText} = require './spec-helper'

describe 'FileBlob', ->
  [fileBlob] = []

  beforeEach ->
    fileBlob = new FileBlob(getFixturePath('test.coffee'))

  it 'gets the name of the file', ->
    expect(fileBlob.getName()).toEqual getFixturePath('test.coffee')

  it 'gets the size of the file', ->
    expect(fileBlob.getSize()).toEqual 5273

  it 'gets the contents of the file', ->
    expect(fileBlob.getData()).toEqual getFixtureText('test.coffee')

  it 'gets the first line of a file', ->
    fileBlob = new FileBlob(path.join(__dirname, '../bin/atom-linguist'))

    expect(fileBlob.getFirstLine()).toEqual '#!/usr/bin/env node'

  describe 'extensions', ->
    beforeEach ->
      fileBlob = new FileBlob('foo/bar/baz.html.erb')

    it 'gets all the extension combinations of the file', ->
      expect(fileBlob.getExtensions()).toEqual ['.html.erb', '.erb']

    it 'gets the last extension', ->
      expect(fileBlob.getExtension()).toEqual '.erb'
