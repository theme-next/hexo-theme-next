/* global hexo */

'use strict';

hexo.extend.helper.register('hexo_env', type => hexo.env[type]);

hexo.extend.helper.register('next_env', type => {
  const path = require('path');
  const env = require(path.normalize('../../package.json'));
  return env[type];
});
