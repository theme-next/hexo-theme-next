{% if theme.bookmark and theme.bookmark.enable %}
  {% set bookmark_uri = url_for(theme.vendors._internal + '/bookmark/bookmark.min.js?v=1.0')%}
  <script src="{{ bookmark_uri }}"></script>
  <script type="text/javascript">
  {% if is_post() %}
    bookmark.scrollToMark('{{ theme.bookmark.save }}', "#{{ __('post.more') }}");
  {% else %}
    bookmark.loadBookmark();
  {% endif %}
  </script>
{% endif %}
