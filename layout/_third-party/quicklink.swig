{% if theme.quicklink %}
  {% set quicklink_uri = url_for(theme.vendors._internal + '/quicklink/dist/quicklink.umd.js') %}
  {% if theme.vendors.quicklink %}
    {% set quicklink_uri = theme.vendors.quicklink %}
  {% endif %}
  <script src="{{ quicklink_uri }}"></script>
  <script>
		window.addEventListener('load', () => {
      quicklink({
        priority: true,
        ignores: [
          uri => uri.includes('#')
        ]
      });
    });
  </script>
{% endif %}