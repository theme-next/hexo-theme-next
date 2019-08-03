<script>
var pjax = new Pjax({
  selectors: [
    'title',
    'meta[name=description]',
    '#page-configurations',
    '.content-wrap',
    '.sidebar-inner',
    '#pjax'
  ],
  switches: {
    '.sidebar-inner': Pjax.switches.innerHTML
  },
  cacheBust: false,
  analytics: false
});
$(document).on('pjax:send', function() {
  $('.sidebar-inner').fadeOut();
});
$(document).on('pjax:success', function() {
  $('.motion-element').css("opacity", 1);
  $('.sidebar-inner').stop().fadeIn();
  $('script[pjax], script#page-configurations, #pjax script').each(function(i, o) {
    $(o).parent().append($(o).remove());
  });
  // Define Motion Sequence & Bootstrap Motion.
  CONFIG.motion.enable && NexT.motion.integrator
    .init()
    .add(NexT.motion.middleWares.postList)
    .add(NexT.motion.middleWares.sidebar)
    .bootstrap();
});
</script>
