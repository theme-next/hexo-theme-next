/* global hexo */

'use strict';

const path = require('path');
const {iconText} = require('./common');
const priority = hexo.config.inject_priority || {};

// Add comment
hexo.extend.filter.register('theme_inject', function(injects) {
  let theme = hexo.theme.config;
  if (!theme.changyan.enable || !theme.changyan.appid || !theme.changyan.appkey) return;

  injects.comment.raw('changyan', `
  <div class="comments" id="comments">
    <div id="SOHUCS"></div>
  </div>
  `, {}, {cache: true});

  injects.bodyEnd.file('changyan', path.join(hexo.theme_dir, 'layout/_third-party/comments/changyan.swig'));

}, priority.changyan);

// Add post_meta
hexo.extend.filter.register('theme_inject', function(injects) {
  let theme = hexo.theme.config;
  if (!theme.changyan.enable || !theme.changyan.appid || !theme.changyan.appkey) return;

  injects.postMeta.raw('changyan', `
  {% if post.comments %}
  <span class="post-meta-item">
    ${iconText}
    {% if is_post() %}
      <a href="{{ url_for(post.path) }}#SOHUCS" itemprop="discussionUrl">
        <span id="changyan_count_unit" class="post-comments-count hc-comment-count" data-xid="{{ post.path }}" itemprop="commentCount"></span>
      </a>
    {% else %}
      <a href="{{ url_for(post.path) }}#SOHUCS" itemprop="discussionUrl">
        <span id="url::{{ post.permalink }}" class="cy_cmt_count" data-xid="{{ post.path }}" itemprop="commentCount"></span>
      </a>
    {% endif %}
  </span>
  {% endif %}
  `);

}, priority.changyan_post_meta);
