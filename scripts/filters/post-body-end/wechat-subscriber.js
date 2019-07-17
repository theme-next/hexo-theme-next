/* global hexo */

'use strict';

const priority = hexo.config.inject_priority_wechat_subscriber || 110;

const path = require('path');

hexo.extend.filter.register('theme_inject', function(injects) {
  if (hexo.theme.config.wechat_subscriber.enable) {
    injects.postBodyEnd.file('wechat-subscriber', path.join(hexo.theme_dir, 'layout/_partials/post/wechat-subscriber.swig'), {}, {cache: true});
  }
}, priority);
