{% if theme.facebook_sdk.enable %}
  <span class="post-comments-count">
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-comment-o"></i>
    </span>
    <span class="post-meta-item-text">{{ __('post.comments_count') + __('symbol.colon') }}</span>
    <a href="{{ url_for(post.path) }}#comments" itemprop="discussionUrl">
      <span class="post-comments-count fb-comments-count" data-href="{{ post.permalink }}" itemprop="commentCount">0</span>
    </a>
  </span>
{% endif %}
