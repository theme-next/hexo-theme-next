const fs = require('fs');
const path = require('path');
const gulp = require('gulp');
const eslint = require('gulp-eslint');
const shell = require('gulp-shell');
const yaml = require('js-yaml');

gulp.task('lint', () => gulp.src([
  './source/js/**/*.js',
  './scripts/**/*.js'
]).pipe(eslint())
  .pipe(eslint.format()));

gulp.task('lint:stylus', shell.task([
  '"./node_modules/.bin/stylint" ./source/css/'
]));

gulp.task('validate:config', cb => {
  const themeConfig = fs.readFileSync(path.join(__dirname, '_config.yml'));

  try {
    yaml.safeLoad(themeConfig);
    return cb();
  } catch (error) {
    return cb(new Error(error));
  }
});

gulp.task('validate:languages', cb => {
  const languagesPath = path.join(__dirname, 'languages');
  const languages = fs.readdirSync(languagesPath);
  const errors = [];

  languages.forEach(lang => {
    const languagePath = path.join(languagesPath, lang);
    try {
      yaml.safeLoad(fs.readFileSync(languagePath), {
        filename: path.relative(__dirname, languagePath)
      });
    } catch (error) {
      errors.push(error);
    }
  });

  if (errors.length === 0) {
    return cb();
  } else {
    return cb(errors);
  }
});

gulp.task('default', gulp.series('lint', 'validate:config', 'validate:languages'));
