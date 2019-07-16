{% if theme.live2d.enable %}
  <script src="{{ url_for(theme.vendors._internal + '/live2d/assets/waifu-tips.js') }}"></script>
  <script src="{{ url_for(theme.vendors._internal + '/live2d/assets/live2d.js') }}"></script>
  <script type="text/javascript">$(document).ready(function(){
    {% if theme.live2d.modelId %}
      live2d_settings['modelId'] =  {{ theme.live2d.modelId }}; // 默认模型 ID
    {% endif %}
    {% if theme.live2d.modelTexturesId %}
      live2d_settings['modelTexturesId'] =  {{ theme.live2d.modelTexturesId }}; // 默认模型 ID
    {% endif %}
        {% if theme.live2d.modelStorage %}
      live2d_settings['modelStorage'] =  {{ theme.live2d.modelStorage }}; // 是否储存模型 ID
    {% endif %}
    initModel("{{ url_for(theme.vendors._internal + '/live2d/assets/waifu-tips.json') }}");
  })</script>
{% endif %}
