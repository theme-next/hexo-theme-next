{% if theme.comments.type %}
  {% set comments_index_path = theme.comments.type|lower + '/index.swig' %}
  {% include comments_index_path ignore missing %}
{% endif %}
