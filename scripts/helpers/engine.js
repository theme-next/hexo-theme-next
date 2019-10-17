/* global hexo */

'use strict';

const crypto = require('crypto');

hexo.extend.helper.register('gitalk_md5', function(path) {
  var str = this.url_for(path);
  str = encodeURI(str);
  str.replace('index.html', '');
  return crypto.createHash('md5').update(str).digest('hex');
});

hexo.extend.helper.register('hexo_env', type => hexo.env[type]);
