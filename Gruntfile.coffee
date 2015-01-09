module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    coffeelint:
      options: grunt.file.readJSON('coffeelint.json')
      src: ['src/*.coffee']
      test: ['spec/*.coffee']

    shell:
      spec:
        command: './node_modules/jasmine-focused/bin/jasmine-focused --captureExceptions --coffee spec/'
        options:
          stdout: true
          stderr: true
          failOnError: true

    watch:
      scripts:
        files: ['**/*.coffee']
        tasks: ['spec']
        options:
          spawn: false

  grunt.loadNpmTasks('grunt-shell')
  grunt.loadNpmTasks('grunt-coffeelint')
  grunt.loadNpmTasks('grunt-contrib-watch')

  grunt.registerTask 'clean', -> require('rimraf').sync('lib')
  grunt.registerTask('lint', ['coffeelint:src', 'coffeelint:test'])
  grunt.registerTask('default', ['lint', 'spec'])
  grunt.registerTask('spec', ['shell:spec'])
  grunt.registerTask('test', ['spec'])
