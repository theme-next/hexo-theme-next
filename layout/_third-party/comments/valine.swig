{% if theme.valine.enable and theme.valine.appid and theme.valine.appkey %}
  <script src="//cdn1.lncld.net/static/js/3.0.4/av-min.js"></script>
  {% set valine_uri = '//unpkg.com/valine/dist/Valine.min.js' %}
  {% if theme.vendors.valine %}
    {% set valine_uri = theme.vendors.valine %}
  {% endif %}
  <script src="{{ valine_uri }}"></script>
  
  <script type="text/javascript">
    var GUEST = ['nick','mail','link'];
    var guest = '{{ theme.valine.guest_info }}';
    guest = guest.split(',').filter(function (item) {
      return GUEST.indexOf(item)>-1;
    });
    new Valine({
        el: '#comments' ,
        verify: {{ theme.valine.verify }},
        notify: {{ theme.valine.notify }},
        appId: '{{ theme.valine.appid }}',
        appKey: '{{ theme.valine.appkey }}',
        placeholder: '{{ theme.valine.placeholder }}',
        avatar:'{{ theme.valine.avatar }}',
        meta:guest,
        pageSize:'{{ theme.valine.pageSize }}' || 10,
        visitor: {{ theme.valine.visitor }}
    });
  </script>
{% endif %}
