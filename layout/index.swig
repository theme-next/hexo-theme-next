{% extends '_layout.swig' %}
{% import '_macro/sidebar.swig' as sidebar_template with context %}
{% import '_macro/post.swig' as post_template with context %}

{% block title %}{{ title }}{%- if theme.index_with_subtitle and subtitle %} - {{ subtitle }}{%- endif %}{% endblock %}

{% block content %}

  <div class="posts-expand">
    {%- for post in page.posts.toArray() %}
      {{ post_template.render(post, true) }}
    {%- endfor %}
  </div>

  {% include '_partials/pagination.swig' %}

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
