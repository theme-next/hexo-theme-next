/* global hexo */

'use strict';

const path = require('path');
const { iconText } = require('./common');

// Add comment
hexo.extend.filter.register('theme_inject', injects => {
  let theme = hexo.theme.config;
  if (!theme.waline.enable || !theme.waline.serverURL) return;

  injects.comment.raw('waline', '<div class="comments" id="waline-comments"></div>', {}, {cache: true});

  injects.bodyEnd.file('waline', path.join(hexo.theme_dir, 'layout/_third-party/comments/waline.swig'));

});

// Add post_meta
hexo.extend.filter.register('theme_inject', injects => {
  let theme = hexo.theme.config;
  if (!theme.waline.enable || !theme.waline.serverURL) return;

  injects.postMeta.raw('waline', `
  {% if post.comments and (is_post() or theme.waline.comment_count) %}
  <span class="post-meta-item">
    ${iconText('far fa-comment', 'waline')}
    <a title="waline" href="{{ url_for(post.path) }}#waline-comments" itemprop="discussionUrl">
      <span class="post-comments-count waline-comment-count" id="{{ url_for(post.path) }}" data-xid="{{ url_for(post.path) }}" itemprop="commentCount"></span>
    </a>
  </span>
  {% endif %}
  `, {}, {}, theme.waline.post_meta_order);

});
