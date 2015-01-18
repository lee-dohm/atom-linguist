FileBlob = require '../lib/file-blob'
ShebangStrategy = require '../lib/shebang-strategy'

{getFixturePath} = require './spec-helper'

describe 'ShebangStrategy', ->
  [blob, strategy] = []

  beforeEach ->
    strategy = ShebangStrategy

  it 'returns an empty array if there is no shebang', ->
    expect(strategy.employ(new FileBlob(getFixturePath('noshebang')))).toEqual []

  it 'detects a direct reference shebang', ->
    expect(strategy.employ(new FileBlob(getFixturePath('bash-shebang')))).toEqual ['Shell']

  it 'detects an env-style shebang', ->
    expect(strategy.employ(new FileBlob(getFixturePath('env-shebang')))).toEqual ['CoffeeScript']
