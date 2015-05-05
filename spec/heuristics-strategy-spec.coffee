FileBlob = require '../lib/file-blob'
HeuristicsStrategy = require '../lib/heuristics-strategy'

{getFixturePath} = require './spec-helper'

describe 'HeuristicsStrategy', ->
  [strategy] = []

  beforeEach ->
    strategy = HeuristicsStrategy

  it 'has one heuristic', ->
    expect(strategy.heuristics.length).toBe 1

  it 'matches the expected languages', ->
    [match, __] = strategy.heuristics[0]
    expect(match(['C', 'C++', 'Objective-C'])).toBeTruthy()

  it 'resolves C++', ->
    [__, resolve] = strategy.heuristics[0]
    expect(resolve(new FileBlob(getFixturePath('cpp.h')).getData())).toEqual 'C++'

  it 'returns an empty array if there is nothing to do', ->
    expect(strategy.employ(new FileBlob(getFixturePath('noshebang')), ['Fortran'])).toEqual []

  it 'returns a single entry array if it finds an answer', ->
    expect(strategy.employ(new FileBlob(getFixturePath('cpp.h')), ['Objective-C', 'C', 'C++'])).toEqual ['C++']
