<header class="post-header">

<h1 class="post-title" itemprop="name headline">
  {{- page.title }}
  {{- post_edit(page.source) }}
</h1>

<div class="post-meta">
  {%- if page.description %}
    <div class="post-description">{{ page.description }}</div>
  {%- endif %}
  {% include '_partials/page/breadcrumb.swig' %}
</div>

</header>
