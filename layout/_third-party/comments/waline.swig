{%- set waline_uri = theme.vendors.waline or '//unpkg.com/@waline/client/dist/Waline.min.js' %}

<script>
NexT.utils.loadComments(document.querySelector('#waline-comments'), () => {
  NexT.utils.getScript('{{ waline_uri }}', () => {
    var GUEST = ['nick', 'mail', 'link'];
    var guest = '{{ theme.valine.guest_info }}';
    guest = guest.split(',').filter(item => {
      return GUEST.includes(item);
    });
    new Waline({
      el            : '#waline-comments',
      serverURL     : '{{ theme.waline.serverURL }}',
      placeholder   : {{ theme.waline.placeholder | json }},
      path          : location.pathname,
      avatar        : '{{ theme.waline.avatar }}',
      meta          : guest,
      pageSize      : '{{ theme.waline.pageSize }}' || 10,
      lang          : '{{ theme.waline.language }}' || 'zh-cn',
      visitor       : {{ theme.waline.visitor }},
      highlight     : {{ theme.waline.highlight }},
      avatarForce   : {{ theme.waline.avatarForce }},
      emojiCDN      : '{{ theme.waline.emojiCDN }}',
      emojiMaps     : {{ theme.waline.emojiMaps | json }},
      requiredFields: {{ theme.waline.requiredFields | json }}
    });
  }, window.Waline);
});
</script>
