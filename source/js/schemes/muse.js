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
        width  : '100%',
        opacity: 1,
        left   : 0,
        rotateZ: 0,
        top    : 0
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
      this.el.velocity('stop').velocity(this.status[status]);
    };
  }

  var isRight = CONFIG.sidebar.position !== 'left';

  var sidebarToggleLine1st = isRight
    ? new SidebarToggleLine({
      el    : '.sidebar-toggle-line-first',
      status: {
        arrow: {width: '50%', rotateZ: '-45deg', top: '2px'},
        close: {width: '100%', rotateZ: '-45deg', top: '5px'}
      }
    })
    : new SidebarToggleLine({
      el: '.sidebar-toggle-line-first',
      status: {
        arrow: {width: '50%', rotateZ: '45deg', top: '2px', left: '50%'},
        close: {width: '100%', rotateZ: '-45deg', top: '5px', left: '0px'}
      }
    });
  var sidebarToggleLine2nd = isRight
    ? new SidebarToggleLine({
      el    : '.sidebar-toggle-line-middle',
      status: {
        arrow: {width: '90%'},
        close: {opacity: 0}
      }
    })
    : new SidebarToggleLine({
      el     : '.sidebar-toggle-line-middle',
      status : {
        arrow: {width: '90%', left: '2px'},
        close: {opacity: 0, left: '0px'}
      }
    });
  var sidebarToggleLine3rd = isRight
    ? new SidebarToggleLine({
      el    : '.sidebar-toggle-line-last',
      status: {
        arrow: {width: '50%', rotateZ: '45deg', top: '-2px'},
        close: {width: '100%', rotateZ: '45deg', top: '-5px'}
      }
    })
    : new SidebarToggleLine({
      el    : '.sidebar-toggle-line-last',
      status: {
        arrow: {width: '50%', rotateZ: '-45deg', top: '-2px', left: '50%'},
        close: {width: '100%', rotateZ: '45deg', top: '-5px', left: '0px'}
      }
    });

  sidebarToggleLines.push(sidebarToggleLine1st);
  sidebarToggleLines.push(sidebarToggleLine2nd);
  sidebarToggleLines.push(sidebarToggleLine3rd);

  var SIDEBAR_WIDTH = CONFIG.sidebar.width || '320px', SIDEBAR_DISPLAY_DURATION = 200, xPos, yPos;

  var sidebarToggleMotion = {
    toggleEl        : $('.sidebar-toggle'),
    dimmerEl        : $('#sidebar-dimmer'),
    sidebarEl       : $('.sidebar'),
    isSidebarVisible: false,
    init            : function() {
      this.toggleEl.on('click', this.clickHandler.bind(this));
      this.dimmerEl.on('click', this.clickHandler.bind(this));
      this.toggleEl.on('mouseenter', this.mouseEnterHandler.bind(this));
      this.toggleEl.on('mouseleave', this.mouseLeaveHandler.bind(this));
      this.sidebarEl.on('touchstart', this.touchstartHandler.bind(this));
      this.sidebarEl.on('touchend', this.touchendHandler.bind(this));
      this.sidebarEl.on('touchmove', function(e) { e.preventDefault(); });

      $(document)
        .on('sidebar.isShowing', function() {
          NexT.utils.isDesktop() && $('body').velocity('stop').velocity(
            isRight ? {paddingRight: SIDEBAR_WIDTH} : {paddingLeft: SIDEBAR_WIDTH},
            SIDEBAR_DISPLAY_DURATION
          );
        });
    },
    clickHandler: function() {
      this.isSidebarVisible ? this.hideSidebar() : this.showSidebar();
      this.isSidebarVisible = !this.isSidebarVisible;
    },
    mouseEnterHandler: function() {
      if (this.isSidebarVisible) {
        return;
      }
      sidebarToggleLines.arrow();
    },
    mouseLeaveHandler: function() {
      if (this.isSidebarVisible) {
        return;
      }
      sidebarToggleLines.init();
    },
    touchstartHandler: function(e) {
      xPos = e.originalEvent.touches[0].clientX;
      yPos = e.originalEvent.touches[0].clientY;
    },
    touchendHandler: function(e) {
      var _xPos = e.originalEvent.changedTouches[0].clientX;
      var _yPos = e.originalEvent.changedTouches[0].clientY;
      if (_xPos - xPos > 30 && Math.abs(_yPos - yPos) < 20) {
        this.clickHandler();
      }
    },
    showSidebar: function() {
      var self = this;

      sidebarToggleLines.close();

      this.sidebarEl.velocity('stop').velocity({
        width: SIDEBAR_WIDTH
      }, {
        display : 'block',
        duration: SIDEBAR_DISPLAY_DURATION,
        begin   : function() {
          $('.sidebar .motion-element').not('.site-state').velocity(
            isRight ? 'transition.slideRightIn' : 'transition.slideLeftIn', {
              stagger : 50,
              drag    : true,
              complete: function() {
                self.sidebarEl.trigger('sidebar.motion.complete');
              }
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
          self.sidebarEl.trigger('sidebar.didShow');
        }
      });

      this.sidebarEl.trigger('sidebar.isShowing');
    },
    hideSidebar: function() {
      NexT.utils.isDesktop() && $('body').velocity('stop').velocity(isRight ? {paddingRight: 0} : {paddingLeft: 0});
      this.sidebarEl.find('.motion-element').velocity('stop').css('display', 'none');
      this.sidebarEl.velocity('stop').velocity({width: 0}, {display: 'none'});

      sidebarToggleLines.init();

      this.sidebarEl.removeClass('sidebar-active');
      this.sidebarEl.trigger('sidebar.isHiding');

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
    if (containerHeight < window.innerHeight) $('#footer').css({ 'position': 'fixed', 'bottom': 0, 'left': 0, 'right': 0 }).attr('position', 'fixed');
    else $('#footer').removeAttr('style position');
  }

  updateFooterPosition();
  $(window).on('resize scroll', updateFooterPosition);
});
