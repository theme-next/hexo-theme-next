{%- if page.comments %}
{%- set disqusjs_css_uri = theme.vendors.disqusjs_css | default('//cdn.jsdelivr.net/npm/disqusjs@1/dist/disqusjs.css') %}
<link rel="stylesheet" href="{{ disqusjs_css_uri }}">

{%- set disqusjs_js_uri = theme.vendors.disqusjs_js | default('//cdn.jsdelivr.net/npm/disqusjs@1/dist/disqus.js') %}

<script>
  NexT.utils.getScript('{{ disqusjs_js_uri }}', () => {
    window.dsqjs = new DisqusJS({
      api: '{{ theme.disqusjs.api }}' || 'https://disqus.com/api/',
      apikey: '{{ theme.disqusjs.apikey }}',
      shortname: '{{ theme.disqusjs.shortname }}',
      url: {{ page.permalink | json }},
      identifier: {{ page.path | json }},
      title: '{{ page.title | addslashes }}',
    });
  }, window.DisqusJS);
</script>
{%- endif %}
