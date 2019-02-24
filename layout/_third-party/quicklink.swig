{% if theme.quicklink and theme.quicklink.enable %}
  {% set quicklink_uri = url_for(theme.vendors._internal + '/quicklink/dist/quicklink.umd.js') %}
  {% if theme.vendors.quicklink %}
    {% set quicklink_uri = theme.vendors.quicklink %}
  {% endif %}
  <script src="{{ quicklink_uri }}"></script>
  <script>
		window.addEventListener('load', () => {
      quicklink({
        timeout: {{ theme.quicklink.timeout }},
        priority: {{ theme.quicklink.priority }},
        ignores: [uri => uri.includes('#'), {{ theme.quicklink.ignores }}]
      });
    });
  </script>
{% endif %}