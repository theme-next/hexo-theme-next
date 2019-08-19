/* global NexT */

(function() {

  function initScrollSpy() {
    var tocSelector = '.post-toc';
    var $tocElement = $(tocSelector);
    var activeCurrentSelector = '.active-current';

    function removeCurrentActiveClass() {
      $(tocSelector + ' ' + activeCurrentSelector)
        .removeClass(activeCurrentSelector.substring(1));
    }

    $tocElement
      .on('activate.bs.scrollspy', () => {
        var $currentActiveElement = $(tocSelector + ' .active').last();

        removeCurrentActiveClass();
        $currentActiveElement.addClass('active-current');

        // Scrolling to center active TOC element if TOC content is taller then viewport.
        $tocElement.scrollTop($currentActiveElement.offset().top - $tocElement.offset().top + $tocElement.scrollTop() - ($tocElement.height() / 2));
      })
      .on('clear.bs.scrollspy', removeCurrentActiveClass);

    $('body').scrollspy({ target: tocSelector });
  }

  initScrollSpy();

  var TAB_ANIMATE_DURATION = 200;

  $('.sidebar-nav li').on('click', event => {
    var item = $(event.currentTarget);
    var activeTabClassName = 'sidebar-nav-active';
    var activePanelClassName = 'sidebar-panel-active';
    if (item.hasClass(activeTabClassName)) {
      return;
    }

    var target = $('.' + item.data('target'));
    var currentTarget = target.siblings('.sidebar-panel');
    currentTarget.animate({ opacity: 0 }, TAB_ANIMATE_DURATION, () => {
      currentTarget.hide();
      target
        .stop()
        .css({'opacity': 0, 'display': 'block'})
        .animate({ opacity: 1 }, TAB_ANIMATE_DURATION, () => {
          currentTarget.removeClass(activePanelClassName);
          target.addClass(activePanelClassName);
        });
    });

    item.siblings().removeClass(activeTabClassName);
    item.addClass(activeTabClassName);
  });
  if (document.querySelector('.post-toc-wrap').childElementCount > 0) {
    document.querySelector('.sidebar-nav').style.display = '';
    document.querySelector('.sidebar-nav-toc').click();
  } else {
    document.querySelector('.sidebar-nav').style.display = 'none';
    document.querySelector('.sidebar-nav-overview').click();
  }

  // TOC item animation navigate & prevent #item selector in adress bar.
  $('.post-toc a').on('click', event => {
    event.preventDefault();
    var targetSelector = NexT.utils.escapeSelector(event.currentTarget.getAttribute('href'));
    var offset = $(targetSelector).offset().top;

    $(document.documentElement).stop().animate({
      scrollTop: offset
    }, 500);
  });
})();
