{% if theme.live2d.enable %}
  <script src="{{ url_for(theme.vendors._internal + '/live2d/assets/waifu-tips.js') }}"></script>
  <script src="{{ url_for(theme.vendors._internal + '/live2d/assets/live2d.js') }}"></script>
  <script type="text/javascript">$(document).ready(function(){
    let live2d_custom = {{ theme.live2d|json_encode }};
    for (let key in live2d_custom){
      console.debug(key+':'+live2d_custom[key]);
      live2d_settings[key] = live2d_custom[key];
      }
    initModel("{{ url_for(theme.vendors._internal + '/live2d/assets/waifu-tips.json') }}");
  })</script>
{% endif %}
