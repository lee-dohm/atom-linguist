main = require '../lib/main'

{getFixturePath} = require './spec-helper'

describe 'atom-linguist', ->
  it 'has a list of strategies', ->
    expect(main.strategies().length).toEqual 2

  it 'detects the file type', ->
    expect(main.detect(getFixturePath('test.coffee'))).toEqual 'CoffeeScript'
