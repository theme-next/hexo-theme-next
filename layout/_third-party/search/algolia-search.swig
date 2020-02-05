{%- set algolia_search_uri = theme.vendors.algolia_search or next_vendors('//cdn.jsdelivr.net/npm/algoliasearch@4/dist/algoliasearch-lite.umd.js') %}
{%- set instant_search_uri = theme.vendors.instant_search or next_vendors('//cdn.jsdelivr.net/npm/instantsearch.js@4/dist/instantsearch.production.min.js') %}
<script src="{{ algolia_search_uri }}"></script>
<script src="{{ instant_search_uri }}"></script>

{{- next_js('algolia-search.js') }}
