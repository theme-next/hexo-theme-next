{% if theme.algolia_search.enable %}
  {% include 'algolia-search.swig' %}
{% elseif theme.swiftype_key %}
  {% include 'swiftype.swig' %}
{% elseif theme.local_search.enable %}
  {% include 'localsearch.swig' %}
{% endif %}
