/* global hexo */

'use strict';

const {iconText} = require('./common');
const priority = hexo.config.inject_priority || {};

// Add comment
hexo.extend.filter.register('theme_inject', function(injects) {
  let theme = hexo.theme.config;
  if (!theme.facebook_sdk.enable || !theme.facebook_comments_plugin.enable) return;

  injects.comment.raw('facebook-comments-plugin', `
  <div class="comments" id="comments">
    <div class="fb-comments"
       data-href="{{ page.permalink }}"
       data-numposts="{{ theme.facebook_comments_plugin.num_of_posts }}"
       data-width="{{ theme.facebook_comments_plugin.width }}"
       data-colorscheme="{{ theme.facebook_comments_plugin.scheme }}">
    </div>
  </div>
  `);

}, priority.facebook_comments_plugin);

// Add post_meta
hexo.extend.filter.register('theme_inject', function(injects) {
  let theme = hexo.theme.config;
  if (!theme.facebook_sdk.enable || !theme.facebook_comments_plugin.enable) return;

  injects.postMeta.raw('facebook-comments-plugin', `
  {% if post.comments %}
  <span class="post-meta-item">
    ${iconText}
    <a href="{{ url_for(post.path) }}#comments" itemprop="discussionUrl">
      <span class="post-comments-count fb-comments-count" data-href="{{ post.permalink }}" itemprop="commentCount">0</span>
    </a>
  </span>
  {% endif %}
  `);

}, priority.facebook_comments_plugin_post_meta);
