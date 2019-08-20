<script>
var pjax = new Pjax({
  selectors: [
    'head title',
    '#page-configurations',
    '.content-wrap',
    '.post-toc-wrap',
    '#pjax'
  ],
  analytics: false,
  cacheBust: false,
  scrollTo: !CONFIG.bookmark.enable
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
  NexT.utils.updateSidebarPosition();
});
</script>
