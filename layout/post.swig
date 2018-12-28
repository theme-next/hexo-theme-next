{% extends '_layout.swig' %}
{% import '_macro/post.swig' as post_template %}

{% block title %}{{ page.title }} | {{ title }}{% endblock %}

{% block page_class %}page-post-detail{% endblock %}

{% block content %}
  <div id="posts" class="posts-expand">
    {{ post_template.render(page) }}
  </div>
{% endblock %}

{% block sidebar %}
{{ partial('_partials/sidebar.swig', {}, {cache: theme.cache.enable}) }}
{% endblock %}

{% block script_extra %}
  {% include '_scripts/pages/post-details.swig' %}
{% endblock %}
