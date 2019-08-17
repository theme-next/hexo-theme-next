/* global hexo */

'use strict';

hexo.extend.helper.register('next_vendors', function(url) {
  if (url.startsWith('//')) return url;
  let internal = hexo.theme.config.vendors._internal;
  return this.url_for(`${internal}/${url}`);
});
