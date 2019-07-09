{% macro render(name) %}

  {% set badges = {
    archives: site.posts.length,
    categories: theme.visibleCategories,
    tags: theme.visibleTags }
  %}
  {% for menu, count in badges %}
    {% if name == menu %}
      <span class="badge">{{ count }}</span>
    {% endif %}
  {% endfor %}

{% endmacro %}
