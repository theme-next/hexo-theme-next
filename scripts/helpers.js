'use strict';

hexo.extend.helper.register('item_active', function(path, className) {
  var canonical = this.page.canonical_path;
  var current = this.url_for(canonical).replace('index.html', '', 'g');
  var url = this.url_for(path);
  var result = '';

  if (current.indexOf(url) !== -1) {
    if (url !== '/' || url === current) {
      result = ' ' + className;
    }
  }
  return result;
});

hexo.extend.helper.register('hexo_version', function() {
  return this.env.version;
});
