{%- set algolia_instant_css_uri = theme.vendors.algolia_instant_css | default(url_for(theme.vendors._internal + '/algolia-instant-search/instantsearch.min.css')) %}
{%- set algolia_instant_js_uri = theme.vendors.algolia_instant_js | default(url_for(theme.vendors._internal + '/algolia-instant-search/instantsearch.min.js')) %}
<link rel="stylesheet" href="{{ algolia_instant_css_uri }}">
<script src="{{ algolia_instant_js_uri }}"></script>

{{- next_js('algolia-search.js') }}
