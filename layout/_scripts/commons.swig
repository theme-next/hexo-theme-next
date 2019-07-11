<script src="{{ url_for(theme.js) }}/utils.js?v={{ version }}"></script>
{% if theme.motion.enable %}
  <script src="{{ url_for(theme.js) }}/motion.js?v={{ version }}"></script>
{% endif %}
