/* global NexT, CONFIG */

window.addEventListener('DOMContentLoaded', () => {

  var sidebarToggleLines = {
    lines: [],
    init : function() {
      this.lines.forEach(line => {
        line.transform('init');
      });
    },
    arrow: function() {
      this.lines.forEach(line => {
        line.transform('arrow');
      });
    },
    close: function() {
      this.lines.forEach(line => {
        line.transform('close');
      });
    }
  };

  function SidebarToggleLine(settings) {
    this.status = Object.assign({
      init: {
        width    : '100%',
        opacity  : 1,
        transform: 'rotate(0deg)',
        top      : 0,
        left     : 0
      }
    }, settings.status);
    this.transform = function(status) {
      document.querySelector(settings.el).css(this.status[status]);
    };
  }

  var isRight = CONFIG.sidebar.position === 'right';

  sidebarToggleLines.lines = [new SidebarToggleLine({
    el    : '.sidebar-toggle-line-first',
    status: isRight
      ? {
        arrow: {width: '50%', transform: 'rotate(-45deg)', top: '2px'},
        close: {width: '100%', transform: 'rotate(-45deg)', top: '5px'}
      } : {
        arrow: {width: '50%', transform: 'rotate(45deg)', top: '2px', left: '50%'},
        close: {width: '100%', transform: 'rotate(-45deg)', top: '5px', left: '0px'}
      }
  }), new SidebarToggleLine({
    el    : '.sidebar-toggle-line-middle',
    status: isRight
      ? {
        arrow: {width: '90%'},
        close: {opacity: 0}
      } : {
        arrow: {width: '90%', left: '2px'},
        close: {opacity: 0, left: '0px'}
      }
  }), new SidebarToggleLine({
    el    : '.sidebar-toggle-line-last',
    status: isRight
      ? {
        arrow: {width: '50%', transform: 'rotate(45deg)', top: '-2px'},
        close: {width: '100%', transform: 'rotate(45deg)', top: '-5px'}
      } : {
        arrow: {width: '50%', transform: 'rotate(-45deg)', top: '-2px', left: '50%'},
        close: {width: '100%', transform: 'rotate(45deg)', top: '-5px', left: '0px'}
      }
  })];

  var SIDEBAR_WIDTH = CONFIG.sidebar.width || 320;
  var SIDEBAR_DISPLAY_DURATION = 400;
  var mousePos = {}; var touchPos = {};

  var sidebarToggleMotion = {
    sidebarEl       : document.querySelector('.sidebar'),
    isSidebarVisible: false,
    init            : function() {
      sidebarToggleLines.init();

      window.addEventListener('mousedown', this.mousedownHandler.bind(this));
      window.addEventListener('mouseup', this.mouseupHandler.bind(this));
      document.querySelector('#sidebar-dimmer').addEventListener('click', this.clickHandler.bind(this));
      document.querySelector('.sidebar-toggle').addEventListener('click', this.clickHandler.bind(this));
      document.querySelector('.sidebar-toggle').addEventListener('mouseenter', this.mouseEnterHandler.bind(this));
      document.querySelector('.sidebar-toggle').addEventListener('mouseleave', this.mouseLeaveHandler.bind(this));
      this.sidebarEl.addEventListener('touchstart', this.touchstartHandler.bind(this));
      this.sidebarEl.addEventListener('touchend', this.touchendHandler.bind(this));
      this.sidebarEl.addEventListener('touchmove', event => event.preventDefault());
      window.addEventListener('sidebar:show', this.showSidebar.bind(this));
      window.addEventListener('sidebar:hide', this.hideSidebar.bind(this));
    },
    mousedownHandler: function(event) {
      mousePos.X = event.pageX;
      mousePos.Y = event.pageY;
    },
    mouseupHandler: function(event) {
      var deltaX = event.pageX - mousePos.X;
      var deltaY = event.pageY - mousePos.Y;
      var clickingBlankPart = Math.sqrt((deltaX * deltaX) + (deltaY * deltaY)) < 20 && event.target.matches('.main');
      if (this.isSidebarVisible && (clickingBlankPart || event.target.matches('img.medium-zoom-image, .fancybox img'))) {
        this.hideSidebar();
      }
    },
    clickHandler: function() {
      this.isSidebarVisible ? this.hideSidebar() : this.showSidebar();
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
    touchstartHandler: function(event) {
      touchPos.X = event.originalEvent.touches[0].clientX;
      touchPos.Y = event.originalEvent.touches[0].clientY;
    },
    touchendHandler: function(event) {
      var deltaX = event.originalEvent.changedTouches[0].clientX - touchPos.X;
      var deltaY = event.originalEvent.changedTouches[0].clientY - touchPos.Y;
      var effectiveSliding = Math.abs(deltaY) < 20 && ((deltaX > 30 && isRight) || (deltaX < -30 && !isRight));
      if (this.isSidebarVisible && effectiveSliding) {
        this.hideSidebar();
      }
    },
    showSidebar: function() {
      this.isSidebarVisible = true;
      this.sidebarEl.classList.add('sidebar-active');
      if (typeof $.Velocity === 'function') {
        $.Velocity(document.querySelectorAll('.sidebar .motion-element:not(.site-state)'), isRight ? 'transition.slideRightIn' : 'transition.slideLeftIn', {
          stagger: 50,
          drag   : true
        });
        $.Velocity(document.querySelector('.site-state'), isRight ? 'transition.slideRightIn' : 'transition.slideLeftIn', {
          stagger: 50,
          drag   : true,
          display: 'flex'
        });
      }

      sidebarToggleLines.close();
      NexT.utils.isDesktop() && $('body').stop().animate(isRight ? {
        'padding-right': SIDEBAR_WIDTH
      } : {
        'padding-left': SIDEBAR_WIDTH
      }, SIDEBAR_DISPLAY_DURATION);
    },
    hideSidebar: function() {
      this.isSidebarVisible = false;
      this.sidebarEl.classList.remove('sidebar-active');

      sidebarToggleLines.init();
      NexT.utils.isDesktop() && $('body').stop().animate(isRight ? {
        'padding-right': 0
      } : {
        'padding-left': 0
      }, SIDEBAR_DISPLAY_DURATION);
    }
  };
  sidebarToggleMotion.init();

  function updateFooterPosition() {
    var containerHeight = document.querySelector('.container').offsetHeight;
    var footer = document.getElementById('footer');
    if (footer.getAttribute('position')) containerHeight += footer.outerHeight(true);
    if (containerHeight < window.innerHeight) {
      footer.css({
        'position': 'fixed',
        'bottom'  : 0,
        'left'    : 0,
        'right'   : 0
      }).setAttribute('position', 'fixed');
    } else {
      footer.removeAttribute('position');
      footer.style.cssText = '';
    }
  }

  updateFooterPosition();
  window.addEventListener('resize', updateFooterPosition);
  window.addEventListener('scroll', updateFooterPosition);
});
