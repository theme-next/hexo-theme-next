/* global NexT, CONFIG */

NexT.boot = {};

NexT.boot.registerEvents = function() {

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

  var TAB_ANIMATE_DURATION = 200;
  $('.sidebar-nav li').on('click', event => {
    var item = $(event.currentTarget);
    var activeTabClassName = 'sidebar-nav-active';
    var activePanelClassName = 'sidebar-panel-active';

    var target = $('.' + item.data('target'));
    if (item.hasClass(activeTabClassName)) {
      target.find('.motion-element').css({ opacity: 1 });
      return;
    }
    var currentTarget = target.siblings('.sidebar-panel');
    currentTarget.animate({ opacity: 0 }, TAB_ANIMATE_DURATION, () => {
      // Prevent adding TOC to Overview if Overview was selected when close & open sidebar.
      currentTarget.removeClass(activePanelClassName);
      target
        .stop()
        .css({ opacity: 0 })
        .addClass(activePanelClassName)
        .animate({ opacity: 1 }, TAB_ANIMATE_DURATION);
    });

    item.siblings().removeClass(activeTabClassName);
    item.addClass(activeTabClassName);
  });

  window.addEventListener('resize', NexT.utils.initSidebarDimension);

  window.addEventListener('hashchange', () => {
    var tHash = location.hash;
    if (tHash !== '' && !tHash.match(/%\S{2}/)) {
      var target = document.querySelector(`.tabs ul.nav-tabs li a[href="${tHash}"]`);
      target && target.click();
    }
  });
};

NexT.boot.refresh = function() {

  /**
   * Register JS handlers by condition option.
   * Need to add config option in Front-End at 'layout/_partials/head.swig' file.
   */
  CONFIG.fancybox && NexT.utils.wrapImageWithFancyBox();
  CONFIG.mediumzoom && window.mediumZoom('.post-body :not(a) > img');
  CONFIG.lazyload && window.lozad('.post-body img').observe();
  CONFIG.pangu && window.pangu.spacingPage();

  CONFIG.exturl && NexT.utils.registerExtURL();
  CONFIG.copycode.enable && NexT.utils.registerCopyCode();
  NexT.utils.registerTabsTag();
  NexT.utils.registerActiveMenuItem();
  NexT.utils.registerSidebarTOC();

  $(':not(.gist) table').wrap('<div class="table-container"></div>');
  document.querySelectorAll('iframe').forEach(element => {
    var SUPPORTED_PLAYERS = [
      'www.youtube.com',
      'player.vimeo.com',
      'player.youku.com',
      'player.bilibili.com',
      'www.tudou.com'
    ];
    var pattern = new RegExp(SUPPORTED_PLAYERS.join('|'));
    if (!element.parentNode.matches('.video-container') && element.src.search(pattern) > 0) {
      $(element).wrap('<div class="video-container"></div>');
      var width = Number(element.width), height = Number(element.height);
      if (width && height) {
        element.parentNode.style.paddingTop = height / width * 100 + '%';
      }
    }
  });
};

NexT.boot.motion = function() {
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
};

window.addEventListener('DOMContentLoaded', () => {
  NexT.boot.registerEvents();
  NexT.boot.refresh();
  NexT.boot.motion();
});
window.addEventListener('pjax:success', NexT.boot.refresh);
