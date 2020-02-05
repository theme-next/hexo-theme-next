{% extends '_layout.swig' %}
{% import '_macro/post-collapse.swig' as post_template with context %}
{% import '_macro/sidebar.swig' as sidebar_template with context %}

{% block title %}{{ __('title.tag') }}: {{ page.tag }} | {{ title }}{% endblock %}

{% block content %}

  {#################}
  {### TAG BLOCK ###}
  {#################}
  <div class="post-block">
    <div class="posts-collapse">
      <div class="collection-title">
        <{%- if theme.seo %}h2{% else %}h1{%- endif %} class="collection-header">
          {{- page.tag }}
          <small>{{ __('title.tag') }}</small>
        </{%- if theme.seo %}h2{% else %}h1{%- endif %}>
      </div>

      {{ post_template.render(page.posts) }}
    </div>
  </div>
  {#####################}
  {### END TAG BLOCK ###}
  {#####################}

  {% include '_partials/pagination.swig' %}

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
