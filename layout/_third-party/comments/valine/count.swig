{% extends '../count.swig' %}

{% block count %}
  {% if theme.valine.appid and theme.valine.appkey %}
    <span class="post-meta-item-text">{{ __('post.comments_count') + __('symbol.colon') }}</span>
    <a href="{{ url_for(post.path) }}#comments" itemprop="discussionUrl">
      <span class="post-comments-count valine-comment-count" data-xid="{{ url_for(post.path) }}" itemprop="commentCount"></span>
    </a>
  {% endif %}
{% endblock %}
