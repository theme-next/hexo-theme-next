{% extends '_layout.swig' %}
{% import '_macro/post.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}{{ title }}{% if theme.index_with_subtitle and subtitle %} – {{ subtitle }}{% endif %}{% endblock %}

{% block page_class %}
  {% if is_home() %}page-home{% endif -%}
{% endblock %}

{% block content %}
  <section id="posts" class="posts-expand">
    {% for post in page.posts %}
      {% if is_home() && page.current === 1 %}
        {% set hide = false %}
        {% if theme.hide.hide_post && post.hide %}
          {% set hide = true %}
        {% elif theme.hide.hide_categories.enable %}
          {% for cat in post.categories %}
            {% if !hide %}
              {% for categorie in cat %}
                {% if !hide %}
                  {% for item in theme.hide.hide_categories.categories %}
                    {% if !hide && item == categorie %}
                      {% set hide = true %}
                    {% endif %}
                  {% endfor %}
                {% endif %}
              {% endfor %}
            {% endif %}
          {% endfor %}
        {% endif %}
        {% if !hide %}
          {{ post_template.render(post, true) }}
        {% endif %}
      {% else %}
        {{ post_template.render(post, true) }}
      {% endif %}
    {% endfor %}
  </section>

  {% include '_partials/pagination.swig' %}
{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}