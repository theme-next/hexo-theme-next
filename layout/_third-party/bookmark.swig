{%- if theme.bookmark.enable %}
  {%- set bookmark_uri = theme.vendors.bookmark | default(url_for(theme.vendors._internal + '/bookmark/bookmark.min.js?v=1.0')) %}
  <script src="{{ bookmark_uri }}"></script>
  <script{{ pjax }}>
  if (CONFIG.page.isPost) {
    bookmark.scrollToMark('{{ theme.bookmark.save }}', "#{{ __('post.more') }}");
  } else {
    bookmark.loadBookmark();
  }
  </script>
{%- endif %}
