{%- set algolia_instant_css_uri = theme.vendors.algolia_instant_css | default(next_vendors('//cdn.jsdelivr.net/npm/instantsearch.js@2/dist/instantsearch.min.css')) %}
{%- set algolia_instant_js_uri = theme.vendors.algolia_instant_js | default(next_vendors('//cdn.jsdelivr.net/npm/instantsearch.js@2/dist/instantsearch.min.js')) %}
<link rel="stylesheet" href="{{ algolia_instant_css_uri }}">
<script src="{{ algolia_instant_js_uri }}"></script>

{{- next_js('algolia-search.js') }}
