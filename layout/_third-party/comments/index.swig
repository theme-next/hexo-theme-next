{% if theme.comments_service %}
  {% set comments_service_index_path = theme.comments_service|lower + '/index.swig' %}
  {% include comments_service_index_path ignore missing %}
{% endif %}
