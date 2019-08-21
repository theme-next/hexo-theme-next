{%- if theme.quicklink.enable %}
  {%- set quicklink_uri = theme.vendors.quicklink | default(next_vendors('//cdn.jsdelivr.net/npm/quicklink@1/dist/quicklink.umd.js')) %}

  {%- if is_home() %}
    {%- if theme.quicklink.home %}
      {%- set loadQL = true %}
    {%- endif %}
  {%- endif %}

  {%- if is_archive() %}
    {%- if theme.quicklink.archive %}
      {%- set loadQL = true %}
    {%- endif %}
  {%- endif %}

  {%- if loadQL or (page.quicklink or post.quicklink) %}
    <script src="{{ quicklink_uri }}"></script>
    <script>
      {%- if theme.quicklink.delay %}
        window.addEventListener('load', () => {
      {%- endif %}
        quicklink({
          timeout: {{ theme.quicklink.timeout }},
          priority: {{ theme.quicklink.priority }},
          ignores: [uri => uri.includes('#'),uri => uri == '{{ url.replace('index.html', '') }}',{{ theme.quicklink.ignores }}]
        });
      {%- if theme.quicklink.delay %}
        });
      {%- endif %}
    </script>
  {%- endif %}
{%- endif %}
