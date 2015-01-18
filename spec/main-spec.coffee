main = require '../lib/main'

describe 'atom-linguist', ->
  it 'has a list of strategies', ->
    expect(main.strategies().length).toEqual 1

  it 'detects the file type', ->
    expect(main.detect(getFixturePath('test.coffee'))).toEqual 'CoffeeScript'
