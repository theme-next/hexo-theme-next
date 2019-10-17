<header class="post-header">

<{%- if theme.seo %}h2{% else %}h1{%- endif %} class="post-title" itemprop="name headline">
  {{- page.title }}
  {{- post_edit(page.source) }}
</{%- if theme.seo %}h2{% else %}h1{%- endif %}>

<div class="post-meta">
  {%- if page.description %}
    <div class="post-description">{{ page.description }}</div>
  {%- endif %}
  {% include '_partials/page/breadcrumb.swig' %}
</div>

</header>
