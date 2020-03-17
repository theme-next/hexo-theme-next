/* global hexo */

'use strict';

const path = require('path');
const { iconText } = require('./common');

// Add comment
hexo.extend.filter.register('theme_inject', injects => {
  let theme = hexo.theme.config;
  if (!theme.minivaline.enable || !theme.minivaline.appid || !theme.minivaline.appkey) return;

  injects.comment.raw('minivaline', '<div class="comments" id="minivaline-comments"></div>', {}, {cache: true});

  injects.bodyEnd.file('minivaline', path.join(hexo.theme_dir, 'layout/_third-party/comments/minivaline.swig'));

});
