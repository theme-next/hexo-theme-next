/* global NexT, CONFIG */

window.addEventListener('DOMContentLoaded', () => {

  CONFIG.back2top.enable && NexT.utils.registerBackToTop();
  NexT.utils.registerCanIUseTag();

  // Mobile top menu bar.
  $('.site-nav-toggle button').on('click', () => {
    var $siteNav = $('.site-nav');
    var ON_CLASS_NAME = 'site-nav-on';
    var isSiteNavOn = $siteNav.hasClass(ON_CLASS_NAME);
    var animateAction = isSiteNavOn ? 'slideUp' : 'slideDown';
    var animateCallback = isSiteNavOn ? 'removeClass' : 'addClass';

    $siteNav.stop()[animateAction]('fast', () => {
      $siteNav[animateCallback](ON_CLASS_NAME);
    });
  });

  // Define Motion Sequence & Bootstrap Motion.
  if (CONFIG.motion.enable) {
    NexT.motion.integrator
      .add(NexT.motion.middleWares.logo)
      .add(NexT.motion.middleWares.menu)
      .add(NexT.motion.middleWares.postList)
      .add(NexT.motion.middleWares.sidebar)
      .bootstrap();
  } else {
    NexT.utils.updateSidebarPosition();
  }
});

$(document).on('DOMContentLoaded pjax:success', () => {

  if (CONFIG.save_scroll) {
    // Read position from localStorage
    var value = localStorage.getItem('scroll' + location.pathname);
    $('html, body').animate({ scrollTop: value || 0 });
    // Write position in localStorage
    NexT.utils.saveScrollTimer = setInterval(() => {
      localStorage.setItem('scroll' + location.pathname, window.scrollY);
    }, 1000);
  }

  /**
   * Register JS handlers by condition option.
   * Need to add config option in Front-End at 'layout/_partials/head.swig' file.
   */
  CONFIG.fancybox && NexT.utils.wrapImageWithFancyBox();
  CONFIG.mediumzoom && window.mediumZoom('.post-body img');
  CONFIG.lazyload && window.lozad('.post-body img').observe();
  CONFIG.pangu && window.pangu.spacingPage();

  CONFIG.exturl && NexT.utils.registerExtURL();
  CONFIG.copycode.enable && NexT.utils.registerCopyCode();
  NexT.utils.registerTabsTag();
  NexT.utils.registerActiveMenuItem();
  NexT.utils.embeddedVideoTransformer();

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

    window.addEventListener('resize', () => {
      updateSidebarHeightTimer && clearTimeout(updateSidebarHeightTimer);

      updateSidebarHeightTimer = setTimeout(() => {
        var sidebarWrapperHeight = document.body.clientHeight - NexT.utils.getSidebarSchemePadding();

        updateSidebarHeight(sidebarWrapperHeight);
      }, 0);
    });

    // Initialize Sidebar & TOC Width.
    var scrollbarWidth = NexT.utils.getScrollbarWidth();
    if ($('.site-overview-wrap').height() > (document.body.clientHeight - NexT.utils.getSidebarSchemePadding())) {
      $('.site-overview').css('width', `calc(100% + ${scrollbarWidth}px)`);
    }
    if ($('.post-toc-wrap').height() > (document.body.clientHeight - NexT.utils.getSidebarSchemePadding())) {
      $('.post-toc').css('width', `calc(100% + ${scrollbarWidth}px)`);
    }

    // Initialize Sidebar & TOC Height.
    updateSidebarHeight(document.body.clientHeight - NexT.utils.getSidebarSchemePadding());
  }
  initSidebarDimension();

  function wrapTable() {
    $('table').not('.gist table').wrap('<div class="table-container"></div>');
  }
  wrapTable();
});
