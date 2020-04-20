/* global hexo */

'use strict';

const path = require('path');

// Add comment
hexo.extend.filter.register('theme_inject', injects => {
  let theme = hexo.theme.config;
  if (!theme.livere_uid) return;

  injects.comment.raw('livere', `
  <div class="comments">
    <div id="lv-container" data-id="city" data-uid="{{ theme.livere_uid }}"></div>
  </div>
  `, {}, {cache: true});

  injects.bodyEnd.file('livere', path.join(hexo.theme_dir, 'layout/_third-party/comments/livere.swig'));

});
