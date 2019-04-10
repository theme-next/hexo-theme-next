{% if theme.comments.type %}
  {% set comments_index_path = '_third-party/comments/' + theme.comments.type|lower + '/index.swig' %}
  {{ partial(comments_index_path) }}
{% endif %}
