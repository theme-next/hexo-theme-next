/* global hexo */

'use strict';

const { iconText } = require('./common');

// Add comment
hexo.extend.filter.register('theme_inject', injects => {
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
  `, {
    configKey: 'facebook_comments_plugin',
    button   : '<i class="fa fa-facebook-official" aria-hidden="true"></i> facebook'
  });

});

// Add post_meta
hexo.extend.filter.register('theme_inject', injects => {
  let theme = hexo.theme.config;
  if (!theme.facebook_sdk.enable || !theme.facebook_comments_plugin.enable) return;

  injects.postMeta.raw('facebook-comments-plugin', `
  {% if post.comments %}
  <span class="post-meta-item">
    ${iconText('comment-o', 'facebook')}
    <a title="facebook comments" href="{{ url_for(post.path) }}#comments" itemprop="discussionUrl">
      <span class="post-comments-count fb-comments-count" data-href="{{ post.permalink }}" itemprop="commentCount">0</span>
    </a>
  </span>
  {% endif %}
  `, {}, {}, theme.facebook_comments_plugin.post_meta_order);

});
