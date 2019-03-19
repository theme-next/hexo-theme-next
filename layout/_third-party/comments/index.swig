{% if theme.comments_service %}
  {% set comments_service_index_path = theme.comments_service + '/index.swig' %}
  {% include comments_service_index_path %}
{% endif %}
