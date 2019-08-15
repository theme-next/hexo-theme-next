{% set sharejs_url = theme.vendors.sharejs_js | default('//cdnjs.cloudflare.com/ajax/libs/social-share.js/1.0.16/js/social-share.min.js') %}
<script src="{{ sharejs_url }}"></script>

{% set share_css_url = theme.vendors.sharejs_css | default('//cdnjs.cloudflare.com/ajax/libs/social-share.js/1.0.16/css/share.min.css') %}
<link rel="stylesheet" href="{{ share_css_url }}">

<div
  class="social-share"
  {% if theme.sharejs.networks %}
    data-sites="{{ theme.sharejs.networks }}"
  {% endif %}
  {% if theme.sharejs.wechat_qrcode.title %}
    data-wechat-qrcode-title="{{ __(theme.sharejs.wechat_qrcode.title) }}"
  {% endif %}
  {% if theme.sharejs.wechat_qrcode.prompt %}
    data-wechat-qrcode-helper="{{ __(theme.sharejs.wechat_qrcode.prompt) }}"
  {% endif %}
>
</div>
