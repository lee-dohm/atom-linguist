_ = require 'underscore-plus'

Languages = require './languages'

# Public: Finds the list of candidate language names by examining the file name.
#
# Defers to the `Languages` class since it has the reverse indexes to make lookups fast.
class FileNameStrategy
  # Public: Executes the strategy on the given parameters and returns the answer.
  #
  # * `blob` {FileBlob} of the file to classify.
  #
  # Returns an {Array} of {String} language names.
  @employ: (blob) ->
    extCandidates = (Languages.findByExtension(ext) for ext in blob.getExtensions())
    nameCandidates = Languages.findByFileName(blob.getName())

    _.uniq(_.flatten(extCandidates.concat(nameCandidates)))

module.exports = FileNameStrategy
