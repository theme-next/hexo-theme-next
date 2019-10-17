/* global hexo */

'use strict';

const path = require('path');
const crypto = require('crypto');

hexo.extend.helper.register('next_inject', function(point) {
  return hexo.theme.config.injects[point]
    .map(item => this.partial(item.layout, item.locals, item.options))
    .join('');
});

hexo.extend.helper.register('next_js', function(...urls) {
  let js = hexo.theme.config.js;
  let version = require(path.normalize('../../package.json')).version;
  return urls.map(url => this.js(`${js}/${url}?v=${version}`)).join('');
});


hexo.extend.helper.register('next_vendors', function(url) {
  if (url.startsWith('//')) return url;
  let internal = hexo.theme.config.vendors._internal;
  return this.url_for(`${internal}/${url}`);
});

hexo.extend.helper.register('gitalk_md5', function(path) {
  var str = this.url_for(path);
  str = encodeURI(str);
  str.replace('index.html', '');
  return crypto.createHash('md5').update(str).digest('hex');
});
