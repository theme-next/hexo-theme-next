'use strict';

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

hexo.extend.helper.register('hexo_version', function() {
  return this.env.version;
});
