{% if theme.algolia_search.enable %}
  {% include '../../_third-party/search/algolia-search/dom.swig' %}
{% elseif theme.swiftype_key %}
  {% include 'swiftype.swig' %}
{% elseif theme.tinysou_Key %}
  {% include 'tinysou.swig' %}
{% elseif theme.local_search.enable %}
  {% include 'localsearch.swig' %}
{% endif %}
