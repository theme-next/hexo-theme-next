/* global hexo */

'use strict';

const path = require('path');

// Add comment
hexo.extend.filter.register('theme_inject', injects => {
  let theme = hexo.theme.config;
  if (!theme.disqusapi.enable || !theme.disqusapi.api|| !theme.disqusapi.forum) return;

  injects.comment.raw('disqusapi', `
  <div class="comments">
    <div id="disqusapi_thread">
      <noscript>Please enable JavaScript to view the comments powered by Disqus.</noscript>
    </div>
  </div>
  `, {}, {cache: true});

  injects.bodyEnd.file('disqusapi', path.join(hexo.theme_dir, 'layout/_third-party/comments/disqusapi.swig'));

});
