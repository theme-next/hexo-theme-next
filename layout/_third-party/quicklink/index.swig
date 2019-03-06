{% if theme.quicklink.enable %}
  {% set quicklink_uri = url_for(theme.vendors._internal + '/quicklink/dist/quicklink.umd.js') %}
  {% if theme.vendors.quicklink %}
    {% set quicklink_uri = theme.vendors.quicklink %}
  {% endif %}

  {% if is_home() %}
    {% if theme.quicklink.home %}
      {% set loadQL = true %}
    {% endif %}
  {% endif %}

  {% if is_archive() %}
    {% if theme.quicklink.archive %}
      {% set loadQL = true %}
    {% endif %}
  {% endif %}
  
  {% if loadQL or (page.quicklink or post.quicklink) %}
    <script src="{{ quicklink_uri }}"></script>
    <script>
      {% if theme.quicklink.delay %}
        window.addEventListener('load', () => {
          {% include 'quicklink.swig' %}
        });
      {% elif not theme.quicklink.delay %}
        {% include 'quicklink.swig' %}
      {% endif %}
    </script>
  {% endif %}
{% endif %}