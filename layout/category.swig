{% extends '_layout.swig' %}
{% import '_macro/post-collapse.swig' as post_template with context %}
{% import '_macro/sidebar.swig' as sidebar_template with context %}

{% block title %}{{ __('title.category') }}: {{ page.category }} | {{ title }}{% endblock %}

{% block class %}category{% endblock %}

{% block content %}

  {######################}
  {### CATEGORY BLOCK ###}
  {######################}
  <div class="post-block">
    <div class="posts-collapse">
      <div class="collection-title">
        <h2 class="collection-header">
          {{- page.category }}
          <small>{{ __('title.category') }}</small>
        </h2>
      </div>

      {{ post_template.render(page.posts) }}
    </div>
  </div>
  {##########################}
  {### END CATEGORY BLOCK ###}
  {##########################}

  {% include '_partials/pagination.swig' %}

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
