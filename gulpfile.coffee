fs = require('fs')
path = require('path')
gulp = require('gulp')
eslint = require('gulp-eslint')
shell = require('gulp-shell')
yaml = require('js-yaml')

gulp.task 'lint', ->
  return gulp.src([
    './source/js/**/*.js',
    './scripts/**/*.js'
  ]).pipe eslint()
    .pipe eslint.format()

gulp.task 'lint:stylus', shell.task [
  '"./node_modules/.bin/stylint" ./source/css/'
]

gulp.task 'validate:config', (cb) ->
  themeConfig = fs.readFileSync path.join(__dirname, '_config.yml')

  try
    yaml.safeLoad(themeConfig)
    cb()
  catch error
    cb new Error(error)

gulp.task 'validate:languages', (cb) ->
  languagesPath = path.join __dirname, 'languages'
  languages = fs.readdirSync languagesPath
  errors = []

  for lang in languages
    languagePath = path.join languagesPath, lang
    try
      yaml.safeLoad fs.readFileSync(languagePath), {
        filename: path.relative(__dirname, languagePath)
      }
    catch error
      errors.push error

  if errors.length == 0
    cb()
  else
    cb(errors)


gulp.task 'default', gulp.series('lint', 'validate:config', 'validate:languages')
