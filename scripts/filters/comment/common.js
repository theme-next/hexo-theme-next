'use strict';

module.exports = {
  iconText: `
    <span class="post-meta-item-icon">
      <i class="fa fa-comment-o"></i>
    </span>
    {% if theme.post_meta.item_text %}
      <span class="post-meta-item-text">{{ __('post.comments_count') + __('symbol.colon') }}</span>
    {% endif %}
  `
};
