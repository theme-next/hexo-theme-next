{%- set valine_uri = theme.vendors.valine | default('//unpkg.com/valine/dist/Valine.min.js') %}

<script>
NexT.utils.getScript('{{ valine_uri }}', () => {
  var GUEST = ['nick', 'mail', 'link'];
  var guest = '{{ theme.valine.guest_info }}';
  guest = guest.split(',').filter(item => {
    return GUEST.indexOf(item) > -1;
  });
  new Valine({
    el: '#comments',
    verify: {{ theme.valine.verify }},
    notify: {{ theme.valine.notify }},
    appId: '{{ theme.valine.appid }}',
    appKey: '{{ theme.valine.appkey }}',
    placeholder: '{{ theme.valine.placeholder }}',
    avatar: '{{ theme.valine.avatar }}',
    meta: guest,
    pageSize: '{{ theme.valine.pageSize }}' || 10,
    visitor: {{ theme.valine.visitor }},
    lang: '{{ theme.valine.language }}' || 'zh-cn',
    path: location.pathname
  });
}, window.Valine);
</script>
