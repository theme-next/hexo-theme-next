{% if theme.algolia_search.enable %}
  {% include 'algolia-search.swig' %}
{% elif theme.local_search.enable %}
  {% include 'localsearch.swig' %}
{% endif %}
