{%- if page.quicklink.enable %}
  {%- set quicklink_uri = theme.vendors.quicklink or next_vendors('//cdn.jsdelivr.net/npm/quicklink@1/dist/quicklink.umd.js') %}
  <script src="{{ quicklink_uri }}"></script>
  <script>
    {%- if page.quicklink.delay %}
      window.addEventListener('load', () => {
    {%- endif %}
      quicklink({
        timeout : {{ page.quicklink.timeout }},
        priority: {{ page.quicklink.priority }},
        ignores : [uri => uri.includes('#'),uri => uri == '{{ url | replace('index.html', '') }}',{{ page.quicklink.ignores }}]
      });
    {%- if page.quicklink.delay %}
      });
    {%- endif %}
  </script>
{%- endif %}
