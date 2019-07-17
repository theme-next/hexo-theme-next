/* global hexo */

'use strict';

const priority = hexo.config.inject_priority_creative_commons || 200;

const path = require('path');

hexo.extend.filter.register('theme_inject', function(injects) {
  let theme = hexo.theme.config;
  if (theme.creative_commons.license && theme.creative_commons.post) {
    injects.postBodyEnd.file('creative-commons', path.join(hexo.theme_dir, 'layout/_partials/post/post-copyright.swig'));
  }
}, priority);
