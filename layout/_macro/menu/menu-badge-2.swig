{% macro render(name, value) %}{#
  #}{% if theme.menu_settings.badges %}{#
    #}{% if name == 'archives' %}{#
      #}{{ __('menu.' + name) | replace('menu.', '') }}{#
      #}<span class="badge">{{ site.posts.length }}</span>
      {% elseif name == 'categories' %}{#
      #}{{ __('menu.' + name) | replace('menu.', '') }}{#
      #}<span class="badge">{{ site.categories.length }}</span>
      {% elseif name == 'tags' %}{#
      #}{{ __('menu.' + name) | replace('menu.', '') }}{#
      #}<span class="badge">{{ site.tags.length }}</span>
      {% else %}{#
      #}{% if value != '[object Object]' %}{#
        #}{{ __('menu.' + name) | replace('menu.', '') }}{#
      #}{% endif %}{#
    #}{% endif %}{#
  #}{% else %}{#
    #}{% if value != '[object Object]' %}{#
      #}{{ __('menu.' + name) | replace('menu.', '') }}{#
    #}{% endif %}{#
  #}{% endif %}{#

#}</a>
</li>
{% endmacro %}
