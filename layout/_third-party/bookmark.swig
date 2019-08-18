{%- if theme.bookmark.enable %}
  {%- set bookmark_uri = theme.vendors.bookmark | default(next_vendors('bookmark/bookmark.min.js?v=1.0')) %}
  <script src="{{ bookmark_uri }}"></script>
  <script{{ pjax }}>
  if (CONFIG.page.isPost) {
    bookmark.scrollToMark('{{ theme.bookmark.save }}', "#{{ __('post.more') }}");
  } else {
    bookmark.loadBookmark();
  }
  </script>
{%- endif %}
