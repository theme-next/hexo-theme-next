{% if theme.quicklink.enable %}
  {% set is_index_has_quicklink = false %}

  {# At home, check if there has `quicklink: true` post #}
  {% if is_home() %}
    {% for post in page.posts %}
      {% if post.quicklink and not is_index_has_quicklink %}
        {% set is_index_has_quicklink = true %}
      {% endif %}
    {% endfor %}
  {% endif %}

  {% if not theme.quicklink.per_page or (is_index_has_quicklink or page.quicklink) %}
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
          ignores: [uri => uri.includes('#'),uri => uri == '{{ url.replace('index.html', '') }}',{{ theme.quicklink.ignores }}]
        });
      });
    </script>
  {% endif %}
{% endif %}