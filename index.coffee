gutil = require("gulp-util")
through = require("through2")
objectAssign = require("object-assign")
jade2php = require("jade2php")

phpDefaultOptions =
    omitPhpExtractor: yes
    omitPhpRuntime: yes
module.exports = (options) ->
  options = options or {}
  through.obj (file, enc, cb) ->
    if file.isNull()
      cb null, file
      return
    if file.isStream()
      cb new gutil.PluginError("gulp-jade2php", "Streaming not supported")
      return
    options = objectAssign({}, options,
      source: file.path
    )
    try
      file.contents = new Buffer(jade2php(file.contents.toString(), phpDefaultOptions))
      @push file
    catch err
      @emit "error", new gutil.PluginError("gulp-jade2php", err,
        fileName: file.path
      )
    cb()
