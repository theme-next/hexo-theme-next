/* global hexo */

'use strict';

hexo.extend.helper.register('hexo_env', function(type) {
  return this.env[type];
});

hexo.extend.helper.register('next_env', function(type) {
  var path = require('path');
  var env = require(path.normalize('../../package.json'));
  return env[type];
});
