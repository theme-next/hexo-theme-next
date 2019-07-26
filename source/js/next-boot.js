/* global NexT, CONFIG */

$(document).ready(function() {

  /**
   * Register JS handlers by condition option.
   * Need to add config option in Front-End at 'layout/_partials/head.swig' file.
   */
  CONFIG.fancybox && NexT.utils.wrapImageWithFancyBox();
  CONFIG.mediumzoom && window.mediumZoom('.post-body img');
  CONFIG.lazyload && window.lozad('.post-body img').observe();
  CONFIG.pangu && window.pangu.spacingPage();

  CONFIG.copycode.enable && NexT.utils.registerCopyCode();
  CONFIG.tabs && NexT.utils.registerTabsTag();
  CONFIG.back2top.enable && NexT.utils.registerBackToTop();
  NexT.utils.embeddedVideoTransformer();

  // Mobile top menu bar.
  $('.site-nav-toggle button').on('click', function() {
    var $siteNav = $('.site-nav');
    var ON_CLASS_NAME = 'site-nav-on';
    var isSiteNavOn = $siteNav.hasClass(ON_CLASS_NAME);
    var animateAction = isSiteNavOn ? 'slideUp' : 'slideDown';
    var animateCallback = isSiteNavOn ? 'removeClass' : 'addClass';

    $siteNav.stop()[animateAction]('fast', function() {
      $siteNav[animateCallback](ON_CLASS_NAME);
    });
  });

  /**
   * Init Sidebar & TOC inner dimensions on all pages and for all schemes.
   * Need for Sidebar/TOC inner scrolling if content taller then viewport.
   */
  function updateSidebarHeight(height) {
    height = height || 'auto';
    $('.site-overview, .post-toc').css('max-height', height);
  }

  function initSidebarDimension() {
    var updateSidebarHeightTimer;

    $(window).on('resize', function() {
      updateSidebarHeightTimer && clearTimeout(updateSidebarHeightTimer);

      updateSidebarHeightTimer = setTimeout(function() {
        var sidebarWrapperHeight = document.body.clientHeight - NexT.utils.getSidebarSchemePadding();

        updateSidebarHeight(sidebarWrapperHeight);
      }, 0);
    });

    // Initialize Sidebar & TOC Width.
    var scrollbarWidth = NexT.utils.getScrollbarWidth();
    if ($('.site-overview-wrap').height() > (document.body.clientHeight - NexT.utils.getSidebarSchemePadding())) {
      $('.site-overview').css('width', 'calc(100% + ' + scrollbarWidth + 'px)');
    }
    if ($('.post-toc-wrap').height() > (document.body.clientHeight - NexT.utils.getSidebarSchemePadding())) {
      $('.post-toc').css('width', 'calc(100% + ' + scrollbarWidth + 'px)');
    }

    // Initialize Sidebar & TOC Height.
    updateSidebarHeight(document.body.clientHeight - NexT.utils.getSidebarSchemePadding());
  }
  initSidebarDimension();

  function wrapTable() {
    $('table').not('.gist table').wrap('<div class="table-container"></div>');
  }
  wrapTable();

  // Define Motion Sequence & Bootstrap Motion.
  CONFIG.motion.enable && NexT.motion.integrator
    .add(NexT.motion.middleWares.logo)
    .add(NexT.motion.middleWares.menu)
    .add(NexT.motion.middleWares.postList)
    .add(NexT.motion.middleWares.sidebar)
    .bootstrap();
});
