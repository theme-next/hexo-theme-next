/* global NexT, CONFIG */

window.addEventListener('DOMContentLoaded', () => {

  NexT.utils.registerScrollPercent();
  NexT.utils.registerCanIUseTag();

  // Mobile top menu bar.
  document.querySelector('.site-nav-toggle button').addEventListener('click', () => {
    var $siteNav = $('.site-nav');
    var ON_CLASS_NAME = 'site-nav-on';
    var isSiteNavOn = $siteNav.hasClass(ON_CLASS_NAME);
    var animateAction = isSiteNavOn ? 'slideUp' : 'slideDown';
    var animateCallback = isSiteNavOn ? 'removeClass' : 'addClass';

    $siteNav.stop()[animateAction]('fast', () => {
      $siteNav[animateCallback](ON_CLASS_NAME);
    });
  });

  window.addEventListener('hashchange', () => {
    var tHash = location.hash;
    if (tHash !== '' && !tHash.match(/%\S{2}/)) {
      var target = document.querySelector(`.tabs ul.nav-tabs li a[href="${tHash}"]`);
      target && target.click();
    }
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
  function initSidebarDimension() {
    // Initialize Sidebar & TOC Height.
    var sidebarWrapperHeight = document.body.clientHeight - NexT.utils.getSidebarSchemePadding();
    $('.site-overview, .post-toc').css('max-height', sidebarWrapperHeight);
  }
  initSidebarDimension();
  window.addEventListener('resize', initSidebarDimension);

  function wrapTable() {
    $('table').not('.gist table').wrap('<div class="table-container"></div>');
  }
  wrapTable();
});
