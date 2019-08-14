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
window.addEventListener('pjax:send', () => {
  $('.sidebar-inner').stop().fadeTo('fast', 0);
  CONFIG.save_scroll && clearInterval(NexT.utils.saveScrollTimer);
});
window.addEventListener('pjax:success', () => {
  document.querySelectorAll('script[pjax], script#page-configurations, #pjax script').forEach(element => {
    $(element).parent().append($(element).remove());
  });
  // Define Motion Sequence & Bootstrap Motion.
  if (CONFIG.motion.enable) {
    NexT.motion.integrator
      .init()
      .add(NexT.motion.middleWares.postList)
      .bootstrap();
  }
  $('.sidebar-inner .motion-element').css('opacity', 1);
  $('.sidebar-inner').fadeTo('fast', 1);
  NexT.utils.updateSidebarPosition();
});
</script>
