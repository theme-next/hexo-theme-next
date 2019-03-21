{% if is_post() and theme.gitment.mint %}
  <span class="post-comments-count">
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-comment-o"></i>
    </span>
    <span class="post-meta-item-text">{{ __('post.comments_count') + __('symbol.colon') }}</span>
    <a href="{{ url_for(post.path) }}#comments" itemprop="discussionUrl">
      <span class="post-comments-count gitment-comments-count" data-xid="{{ url_for(post.path) }}" itemprop="commentsCount"></span>
    </a>
  </span>
{% endif %}
