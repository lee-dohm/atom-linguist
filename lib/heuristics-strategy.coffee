_ = require 'underscore-plus'

class HeuristicsStrategy
  @heuristics: []

  @employ: (blob, languages) ->
    data = blob.getData()
    for [match, resolve] in @heuristics
      candidates = resolve(data) if match(languages)

    candidates ? []

  @add: (heuristic) ->
    @heuristics.push(heuristic)

  @disambiguate = (languages..., resolve) ->
    match = (actualLanguages) ->
      actualLanguages.every (lang) ->
        lang in languages

    @add([match, resolve])

disambiguate = (languages..., resolve) ->
  HeuristicsStrategy.disambiguate(languages..., resolve)

disambiguate 'Objective-C', 'C++', 'C', (data) ->
  switch
    when data.match ///
      ^[ \t]*@(interface|class|protocol|property|end|synchronised|selector|implementation)\b
      ///
      'Objective-C'
    when data.match ///
      ^\s*\#\s*include\s<(cstdint
      |string|vector|map|list|array|bitset|queue|stack|forward_list|unordered_map|unordered_set
      |(i|o|io)stream)>
      ///
      'C++'
    when data.match /^\s*template\s*</
      'C++'
    when data.match /^[ \t]*try/
      'C++'
    when data.match /^[ \t]*catch\s*\(/
      'C++'
    when data.match /^[ \t]*(class|(using[ \t]+)?namespace)\s+\w+/
      'C++'
    when data.match /^[ \t]*(private|public|protected):$/
      'C++'
    when data.match /std::\w+/
      'C++'

module.exports = HeuristicsStrategy
