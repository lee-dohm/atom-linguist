module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    copy:
      languages:
        expand: true
        cwd: 'github-linguist/lib/linguist/'
        src: 'languages.yml'
        dest: 'data/'
        filter: 'isFile'
      samples:
        expand: true
        cwd: 'github-linguist/samples/'
        src: '**/*'
        dest: 'samples/'

    coffeelint:
      options: grunt.file.readJSON('coffeelint.json')
      lib: ['lib/*.coffee']
      spec: ['spec/*.coffee']

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
        tasks: ['lint', 'spec']
        options:
          spawn: false

  grunt.loadNpmTasks('grunt-shell')
  grunt.loadNpmTasks('grunt-coffeelint')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-copy')

  grunt.registerTask 'clean', -> require('rimraf').sync('lib')
  grunt.registerTask('lint', ['coffeelint:lib', 'coffeelint:spec'])
  grunt.registerTask('default', ['lint', 'spec', 'copy'])
  grunt.registerTask('spec', ['shell:spec'])
  grunt.registerTask('test', ['spec'])
