{% if theme.changyan.appid and theme.changyan.appkey %}
  <span class="post-comments-count">
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-comment-o"></i>
    </span>
    {% if is_post() %}
      <span class="post-meta-item-text">{{ __('post.comments_count') + __('symbol.colon') }}</span>
      <a href="{{ url_for(post.path) }}#SOHUCS" itemprop="discussionUrl">
        <span id="changyan_count_unit" class="post-comments-count hc-comment-count" data-xid="{{ post.path }}" itemprop="commentCount"></span>
      </a>
    {% else %}
      <span class="post-meta-item-text">{{ __('post.comments_count') + __('symbol.colon') }}</span>
      <a href="{{ url_for(post.path) }}#SOHUCS" itemprop="discussionUrl">
        <span id="url::{{ post.permalink }}" class="cy_cmt_count" data-xid="{{ post.path }}" itemprop="commentCount"></span>
      </a>
    {% endif %}
  </span>
{% endif %}
