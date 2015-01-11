_ = require 'underscore-plus'

Language = require './language'

# Public: Finds the list of candidate language names by examining the file name.
#
# Defers to the `Language` class since it has the reverse indexes to make lookups fast.
class FileNameStrategy
  @employ: (blob) ->
    extCandidates = (Language.findByExtension(ext) for ext in blob.getExtensions())
    nameCandidates = Language.findByFullName(blob.getName())

    _.uniq(_.flatten(extCandidates.concat(nameCandidates)))

module.exports = FileNameStrategy
