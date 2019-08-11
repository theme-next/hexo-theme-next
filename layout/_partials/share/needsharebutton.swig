{%- if theme.needmoreshare2.float.enable %}
  <div id="needsharebutton-float">
    <span class="btn">
      <i class="fa fa-share-alt" aria-hidden="true"></i>
    </span>
  </div>
{%- endif %}

{%- set needmoreshare2_js_uri = theme.vendors.needmoreshare2_js | default(url_for(theme.vendors._internal + '/needsharebutton/needsharebutton.js')) %}
<script src="{{ needmoreshare2_js_uri }}"></script>
<script>
  {%- if theme.needmoreshare2.postbottom.enable %}
    pbOptions = {};
    {%- for k,v in theme.needmoreshare2.postbottom.options %}
      pbOptions.{{ k }} = "{{ v }}";
    {%- endfor %}
    new needShareButton('#needsharebutton-postbottom', pbOptions);
  {%- endif %}
  {%- if theme.needmoreshare2.float.enable %}
    flOptions = {};
    {%- for k,v in theme.needmoreshare2.float.options %}
      flOptions.{{ k }} = "{{ v }}";
    {%- endfor %}
    new needShareButton('#needsharebutton-float', flOptions);
  {%- endif %}
</script>
