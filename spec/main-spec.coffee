main = require '../lib/main'

describe 'atom-linguist', ->
  it 'has a list of strategies', ->
    expect(main.strategies().length).toEqual 1
