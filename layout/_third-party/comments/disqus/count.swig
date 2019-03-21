{% if theme.disqus.shortname %}
  <span class="post-comments-count">
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-comment-o"></i>
    </span>
    <span class="post-meta-item-text">{{ __('post.comments_count') + __('symbol.colon') }}</span>
    <a href="{{ url_for(post.path) }}#comments" itemprop="discussionUrl">
      <span class="post-comments-count disqus-comment-count" data-disqus-identifier="{{ post.path }}" itemprop="commentCount"></span>
    </a>
  </span>
{% endif %}
