{% extends '../count.swig' %}

{% block count %}
  {% if theme.disqus.count %}
    <span class="post-meta-item-text">{{ __('post.comments_count') + __('symbol.colon') }}</span>
    <a href="{{ url_for(post.path) }}#comments" itemprop="discussionUrl">
      <span class="post-comments-count disqus-comment-count" data-disqus-identifier="{{ post.path }}" itemprop="commentCount"></span>
    </a>
  {% endif %}
{% endblock %}
