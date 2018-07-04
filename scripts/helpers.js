/* global hexo */

'use strict';

hexo.extend.helper.register('hexo_env', function(type) {
  return this.env[type];
});

hexo.extend.helper.register('next_env', function(type) {
  var pathFn = require('path');
  var path = pathFn.normalize('../package.json');
  var env = require(path);
  return env[type];
});

hexo.extend.helper.register('item_active', function(path, className) {
  var canonical = this.page.canonical_path;
  var current = this.url_for(canonical).replace('index.html', '', 'g');
  var result = '';

  if (current.indexOf(path) !== -1) {
    if (path !== '/' || path === current) {
      result = ' ' + className;
    }
  }
  return result;
});
