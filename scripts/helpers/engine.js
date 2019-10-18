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
  const js = hexo.theme.config.js;
  const version = require(path.normalize('../../package.json')).version;
  return urls.map(url => this.js(`${js}/${url}?v=${version}`)).join('');
});

hexo.extend.helper.register('next_vendors', function(url) {
  if (url.startsWith('//')) return url;
  const internal = hexo.theme.config.vendors._internal;
  return this.url_for(`${internal}/${url}`);
});

hexo.extend.helper.register('post_edit', function(src) {
  const theme = hexo.theme.config;
  if (!theme.post_edit.enable) return '';
  const editIcon = '<i class="fa fa-pencil"></i>';
  return this.next_url(theme.post_edit.url + src, editIcon, {
    class: 'post-edit-link',
    title: this.__('post.edit')
  });
});

hexo.extend.helper.register('gitalk_md5', function(path) {
  let str = this.url_for(path);
  str = encodeURI(str);
  str.replace('index.html', '');
  return crypto.createHash('md5').update(str).digest('hex');
});
