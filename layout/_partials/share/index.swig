{%- if theme.add_this_id %}
  {% include 'add-this.swig' %}
{%- endif %}
{%- if theme.likely.enable %}
  {% include 'likely.swig' %}
{%- endif %}
{%- if theme.needmoreshare2.enable %}
  {% include 'needsharebutton.swig' %}
{%- endif %}
