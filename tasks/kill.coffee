cp = require 'child_process'
gulp = require 'gulp'

manifest = require '../src/package.json'
lock = require './lock'
lock.killTask ||= { skip: {} }

[
  ['darwin64', 'pkill -9 ' + manifest.productName]
  ['linux32', 'pkill -9 ' + manifest.name]
  ['linux64', 'pkill -9 ' + manifest.name]
  ['win32', 'taskkill /F /IM ' + manifest.productName + '.exe']
].forEach (item) ->
  [dist, killCommand] = item

  gulp.task 'kill:' + dist, (done) ->
    return done() if lock.killTask.skip[dist]
    lock.killTask.skip[dist] = true
    cp.exec killCommand, -> done()
