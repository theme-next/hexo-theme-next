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

  var sidebarNav = document.querySelector('.sidebar-nav');
  var TAB_ANIMATE_DURATION = 200;

  $(sidebarNav.querySelectorAll('li')).on('click', event => {
    var item = $(event.currentTarget);
    var activeTabClassName = 'sidebar-nav-active';
    var activePanelClassName = 'sidebar-panel-active';
    if (item.hasClass(activeTabClassName)) return;

    var target = $('.' + item.data('target'));
    var currentTarget = target.siblings('.sidebar-panel');
    currentTarget.animate({ opacity: 0 }, TAB_ANIMATE_DURATION, () => {
      currentTarget.hide();
      target
        .stop()
        .css({ 'opacity': 0, 'display': 'block' })
        .animate({ opacity: 1 }, TAB_ANIMATE_DURATION, () => {
          // Prevent adding TOC to Overview if Overview was selected when close & open sidebar.
          currentTarget.removeClass(activePanelClassName, 'motion-element');
          target.addClass(activePanelClassName, 'motion-element');
        });
    });

    item.siblings().removeClass(activeTabClassName);
    item.addClass(activeTabClassName);
  });
  if (document.querySelector('.post-toc-wrap').childElementCount > 0) {
    sidebarNav.style.display = '';
    sidebarNav.classList.add('motion-element');
    document.querySelector('.sidebar-nav-toc').click();
  } else {
    sidebarNav.style.display = 'none';
    sidebarNav.classList.remove('motion-element');
    document.querySelector('.sidebar-nav-overview').click();
  }

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
