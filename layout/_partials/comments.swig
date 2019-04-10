{% if page.comments %}
  {% if theme.comments.type %}
    {% set comments_comment_path = '_third-party/comments/' + theme.comments.type|lower + '/comment.swig' %}
    {{ partial(comments_comment_path) }}
  {% endif %}
{% endif %}
