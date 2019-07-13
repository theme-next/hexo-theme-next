/* global NexT, CONFIG */

$(document).ready(function() {

  var sidebarToggleLines = {
    lines: [],
    push: function(line) {
      this.lines.push(line);
    },
    init: function() {
      this.lines.forEach(function(line) {
        line.init();
      });
    },
    arrow: function() {
      this.lines.forEach(function(line) {
        line.arrow();
      });
    },
    close: function() {
      this.lines.forEach(function(line) {
        line.close();
      });
    }
  };

  function SidebarToggleLine(settings) {
    this.el = $(settings.el);
    this.status = $.extend({}, {
      init: {
        width    : '100%',
        opacity  : 1,
        transform: 'rotate(0deg)',
        top      : 0,
        left     : 0
      }
    }, settings.status);
    this.init = function() {
      this.transform('init');
    };
    this.arrow = function() {
      this.transform('arrow');
    };
    this.close = function() {
      this.transform('close');
    };
    this.transform = function(status) {
      this.el.css(this.status[status]);
    };
  }

  var isRight = CONFIG.sidebar.position !== 'left';

  var sidebarToggleLine1st = new SidebarToggleLine({
    el    : '.sidebar-toggle-line-first',
    status: isRight
      ? {
        arrow: {width: '50%', transform: 'rotate(-45deg)', top: '2px'},
        close: {width: '100%', transform: 'rotate(-45deg)', top: '5px'}
      }
      : {
        arrow: {width: '50%', transform: 'rotate(45deg)', top: '2px', left: '50%'},
        close: {width: '100%', transform: 'rotate(-45deg)', top: '5px', left: '0px'}
      }
  });
  var sidebarToggleLine2nd = new SidebarToggleLine({
    el    : '.sidebar-toggle-line-middle',
    status: isRight
      ? {
        arrow: {width: '90%'},
        close: {opacity: 0}
      }
      : {
        arrow: {width: '90%', left: '2px'},
        close: {opacity: 0, left: '0px'}
      }
  });
  var sidebarToggleLine3rd = new SidebarToggleLine({
    el    : '.sidebar-toggle-line-last',
    status: isRight
      ? {
        arrow: {width: '50%', transform: 'rotate(45deg)', top: '-2px'},
        close: {width: '100%', transform: 'rotate(45deg)', top: '-5px'}
      }
      : {
        arrow: {width: '50%', transform: 'rotate(-45deg)', top: '-2px', left: '50%'},
        close: {width: '100%', transform: 'rotate(45deg)', top: '-5px', left: '0px'}
      }
  });

  sidebarToggleLines.push(sidebarToggleLine1st);
  sidebarToggleLines.push(sidebarToggleLine2nd);
  sidebarToggleLines.push(sidebarToggleLine3rd);

  var SIDEBAR_WIDTH = CONFIG.sidebar.width || '320px';
  var SIDEBAR_DISPLAY_DURATION = 200;
  var mousePos = {}, touchPos = {};

  var sidebarToggleMotion = {
    sidebarEl       : $('.sidebar'),
    isSidebarVisible: false,
    init            : function() {
      sidebarToggleLines.init();

      $('body')
        .on('mousedown', this.mousedownHandler.bind(this))
        .on('mouseup', this.mouseupHandler.bind(this));
      $('#sidebar-dimmer').on('click', this.clickHandler.bind(this));
      $('.sidebar-toggle')
        .on('click', this.clickHandler.bind(this))
        .on('mouseenter', this.mouseEnterHandler.bind(this))
        .on('mouseleave', this.mouseLeaveHandler.bind(this));
      this.sidebarEl
        .on('touchstart', this.touchstartHandler.bind(this))
        .on('touchend', this.touchendHandler.bind(this))
        .on('touchmove', function(e) {
          e.preventDefault();
        });

      $(document)
        .on('sidebar.isShowing', function() {
          NexT.utils.isDesktop() && $('body').stop().animate(
            isRight ? {'padding-right': SIDEBAR_WIDTH} : {'padding-left': SIDEBAR_WIDTH},
            SIDEBAR_DISPLAY_DURATION
          );
        });
    },
    mousedownHandler: function(e) {
      mousePos.X = e.pageX;
      mousePos.Y = e.pageY;
    },
    mouseupHandler: function(e) {
      var deltaX = e.pageX - mousePos.X;
      var deltaY = e.pageY - mousePos.Y;
      if (this.isSidebarVisible && Math.sqrt(deltaX * deltaX + deltaY * deltaY) < 20 && $(e.target).is('.main')) {
        this.clickHandler();
      }
    },
    clickHandler: function() {
      this.isSidebarVisible ? this.hideSidebar() : this.showSidebar();
      this.isSidebarVisible = !this.isSidebarVisible;
    },
    mouseEnterHandler: function() {
      if (!this.isSidebarVisible) {
        sidebarToggleLines.arrow();
      }
    },
    mouseLeaveHandler: function() {
      if (!this.isSidebarVisible) {
        sidebarToggleLines.init();
      }
    },
    touchstartHandler: function(e) {
      touchPos.X = e.originalEvent.touches[0].clientX;
      touchPos.Y = e.originalEvent.touches[0].clientY;
    },
    touchendHandler: function(e) {
      var deltaX = e.originalEvent.changedTouches[0].clientX - touchPos.X;
      var deltaY = e.originalEvent.changedTouches[0].clientY - touchPos.Y;
      if (Math.abs(deltaY) < 20 && ((deltaX > 30 && isRight) || (deltaX < -30 && !isRight))) {
        this.clickHandler();
      }
    },
    showSidebar: function() {
      var self = this;
      sidebarToggleLines.close();

      if ($.isFunction($('html').velocity)) {
        this.sidebarEl.stop().velocity({
          width: SIDEBAR_WIDTH
        }, {
          display : 'block',
          duration: SIDEBAR_DISPLAY_DURATION,
          begin   : function() {
            $('.sidebar .motion-element').not('.site-state').velocity(
              isRight ? 'transition.slideRightIn' : 'transition.slideLeftIn', {
                stagger : 50,
                drag    : true
              }
            );
            $('.site-state').velocity(
              isRight ? 'transition.slideRightIn' : 'transition.slideLeftIn', {
                stagger : 50,
                drag    : true,
                display : 'flex'
              }
            );
          },
          complete: function() {
            self.sidebarEl.addClass('sidebar-active');
          }
        });
      } else {
        $('.sidebar .motion-element').show();
        this.sidebarEl.stop().animate({
          width: SIDEBAR_WIDTH,
          display: 'block'
        }, SIDEBAR_DISPLAY_DURATION, function() {
          self.sidebarEl.addClass('sidebar-active');
        });
      }

      this.sidebarEl.trigger('sidebar.isShowing');
    },
    hideSidebar: function() {
      NexT.utils.isDesktop() && $('body').stop().animate(isRight ? {'padding-right': 0} : {'padding-left': 0});
      this.sidebarEl.find('.motion-element').hide();
      this.sidebarEl.stop().animate({width: 0, display: 'none'}).removeClass('sidebar-active');

      sidebarToggleLines.init();

      // Prevent adding TOC to Overview if Overview was selected when close & open sidebar.
      if ($('.post-toc-wrap')) {
        if ($('.site-overview-wrap').css('display') === 'block') {
          $('.post-toc-wrap').removeClass('motion-element');
        } else {
          $('.post-toc-wrap').addClass('motion-element');
        }
      }
    }
  };
  sidebarToggleMotion.init();

  function updateFooterPosition() {
    var containerHeight = $('#footer').attr('position') ? $('.container').height() + $('#footer').outerHeight(true) : $('.container').height();
    if (containerHeight < window.innerHeight) {
      $('#footer').css({ 'position': 'fixed', 'bottom': 0, 'left': 0, 'right': 0 }).attr('position', 'fixed');
    } else {
      $('#footer').removeAttr('style position');
    }
  }

  updateFooterPosition();
  $(window).on('resize scroll', updateFooterPosition);
});
