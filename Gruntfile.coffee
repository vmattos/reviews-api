
module.exports = (grunt) ->
  pkg = grunt.file.readJSON 'package.json'

  nodeArgs = []
  nodeArgs.push "--verbose" if grunt.option("verbose")

  # Configuring tasks
  config =

    mochaTest:
      main:
        options:
          reporter: 'spec'
        src: ['test/**/*.spec.coffee']

    watch:
      main:
        files: ['test/**', 'src/**', 'libs/**', 'models/**']
        tasks: ['mochaTest']

  # Defining tasks
  tasks =
    default: ['testWatch']
  # Deploy tasks
    test: ['mochaTest']
    testWatch: ['test', 'watch']
    dist: []
    vtex_deploy: ['shell']

  # Project configuration.
  grunt.initConfig config
  grunt.loadNpmTasks name for name of pkg.devDependencies when name[0..5] is 'grunt-' and name isnt 'grunt-vtex'
  grunt.registerTask taskName, taskArray for taskName, taskArray of tasks

