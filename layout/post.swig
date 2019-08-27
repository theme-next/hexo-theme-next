{% extends '_layout.swig' %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}{{ page.title }} | {{ title }}{% endblock %}

{% block content %}

  <div id="posts" class="posts-expand">
    {{ partial('_macro/post.swig', {post: page}) }}
  </div>

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(true) }}
{% endblock %}
