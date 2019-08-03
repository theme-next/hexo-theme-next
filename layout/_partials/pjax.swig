<script>
var pjax = new Pjax({
  selectors: [
    'title',
    '#page-configurations',
    '.content-wrap',
    '.sidebar-inner',
    '#pjax'
  ],
  switches: {
    '.sidebar-inner': Pjax.switches.innerHTML
  },
  analytics: false,
  cacheBust: false,
  scrollTo: !CONFIG.save_scroll
});
$(document).on('pjax:send', function() {
  $('.sidebar-inner').stop().fadeTo('slow', 0);
  CONFIG.save_scroll && clearInterval(NexT.utils.saveScrollTimer);
});
$(document).on('pjax:success', function() {
  $('.sidebar-inner .motion-element').css('opacity', 1);
  $('.sidebar-inner').stop().fadeTo('slow', 1);
  $('script[pjax], script#page-configurations, #pjax script').each(function(i, o) {
    $(o).parent().append($(o).remove());
  });
  // Define Motion Sequence & Bootstrap Motion.
  if (CONFIG.motion.enable) {
    NexT.motion.integrator
      .init()
      .add(NexT.motion.middleWares.postList)
      .bootstrap();
  }
});
</script>
