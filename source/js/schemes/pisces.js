/* global CONFIG */

var Affix = {
  init: function(element, options) {
    this.options = Object.assign({
      offset: 0,
      target: window
    }, options);
    this.target = this.options.target;
    this.target.addEventListener('scroll', this.checkPosition.bind(this));
    this.target.addEventListener('click', this.checkPositionWithEventLoop.bind(this));
    window.matchMedia('(min-width: 992px)').addListener(event => {
      if (event.matches) this.checkPosition();
    });
    this.element = element;
    this.affixed = null;
    this.unpin = null;
    this.pinnedOffset = null;
    this.checkPosition();
  },
  getState: function(scrollHeight, height, offsetTop, offsetBottom) {
    let scrollTop = this.target.scrollY;
    let targetHeight = this.target.innerHeight;
    if (offsetTop != null && this.affixed === 'top') return scrollTop < offsetTop ? 'top' : false;
    if (this.affixed === 'bottom') {
      if (offsetTop != null) return scrollTop + this.unpin <= $(this.element).offset().top ? false : 'bottom';
      return scrollTop + targetHeight <= scrollHeight - offsetBottom ? false : 'bottom';
    }
    let initializing = this.affixed === null;
    let colliderTop = initializing ? scrollTop : $(this.element).offset().top;
    let colliderHeight = initializing ? targetHeight : height;
    if (offsetTop != null && scrollTop <= offsetTop) return 'top';
    if (offsetBottom != null && (colliderTop + colliderHeight >= scrollHeight - offsetBottom)) return 'bottom';
    return false;
  },
  getPinnedOffset: function() {
    if (this.pinnedOffset) return this.pinnedOffset;
    this.element.classList.remove('affix-top', 'affix-bottom');
    this.element.classList.add('affix');
    let scrollTop = this.target.scrollY;
    return (this.pinnedOffset = $(this.element).offset().top - scrollTop);
  },
  checkPositionWithEventLoop() {
    setTimeout(this.checkPosition.bind(this), 1);
  },
  checkPosition: function() {
    if (window.getComputedStyle(this.element).display === 'none') return;
    let height = $(this.element).height();
    let offset = this.options.offset;
    let offsetTop = offset.top;
    let offsetBottom = offset.bottom;
    let scrollHeight = document.body.scrollHeight;
    let affix = this.getState(scrollHeight, height, offsetTop, offsetBottom);
    if (this.affixed !== affix) {
      if (this.unpin != null) this.element.style.top = '';
      let affixType = 'affix' + (affix ? '-' + affix : '');
      this.affixed = affix;
      this.unpin = affix === 'bottom' ? this.getPinnedOffset() : null;
      this.element.classList.remove('affix', 'affix-top', 'affix-bottom');
      this.element.classList.add(affixType);
    }
    if (affix === 'bottom') {
      $(this.element).offset({
        top: scrollHeight - height - offsetBottom
      });
    }
  }
};

window.addEventListener('DOMContentLoaded', () => {
  const sidebarOffset = CONFIG.sidebar.offset || 12;

  let headerOffset = document.querySelector('.header-inner').offsetHeight + sidebarOffset;
  let footer = document.querySelector('#footer');
  let footerInner = document.querySelector('.footer-inner');
  let footerMargin = footer.offsetHeight - footerInner.offsetHeight;
  let footerOffset = footer.offsetHeight + footerMargin;

  Affix.init(document.querySelector('.sidebar-inner'), {
    offset: {
      top   : headerOffset - sidebarOffset,
      bottom: footerOffset
    }
  });
  document.querySelector('.sidebar').css({
    'margin-top' : `${headerOffset}px`,
    'margin-left': 'auto'
  });
});
