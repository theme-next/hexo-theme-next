{{ partial('_partials/header/brand.swig', {}, {cache: theme.cache.enable}) }}

{%- set hasSearch = theme.algolia_search.enable || theme.local_search.enable %}

<nav class="site-nav">
  {{ partial('_partials/header/menu.swig', {}, {cache: theme.cache.enable}) }}

  {%- if theme.scheme === 'Muse' || theme.scheme === 'Mist' %}
    {% include 'sub-menu.swig' %}
  {%- endif %}
</nav>

{%- if hasSearch %}
  <div class="site-search">
    {{ partial('_partials/search/index.swig', {}, {cache: theme.cache.enable}) }}
  </div>
{%- endif %}

{%- for inject_item in theme.injects.header %}
  {{ partial(inject_item.layout, inject_item.locals, inject_item.options) }}
{%- endfor %}
