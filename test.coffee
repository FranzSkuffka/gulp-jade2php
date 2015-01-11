gulp = require 'gulp'
gu = require 'gulp-util'
jade2php = require './'

file = new gu.File {contents: new Buffer("p(class=variable)")}
stream = jade2php()

stream.on 'data', (file) ->
    console.log file.contents.toString()

console.log file.contents.toString()
stream.write file
