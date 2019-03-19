{% extends '../count.swig' %}

{% block count %}
  {% if is_post() and theme.gitment.mint and theme.gitment.count %}
    <span class="post-meta-item-text">{{ __('post.comments_count') + __('symbol.colon') }}</span>
    <a href="{{ url_for(post.path) }}#comments" itemprop="discussionUrl">
      <span class="post-comments-count gitment-comments-count" data-xid="{{ url_for(post.path) }}" itemprop="commentCount"></span>
    </a>
  {% endif %}
{% endblock %}
