/* global hexo */

'use strict';

const path = require('path');

hexo.extend.helper.register('next_js', function(...urls) {
  let js = hexo.theme.config.js;
  let version = require(path.normalize('../../package.json')).version;
  return urls.map(url => this.js(`${js}/${url}?v=${version}`)).join('');
});
