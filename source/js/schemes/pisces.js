/* global NexT, CONFIG */

var Affix = {
  init: function(element, options) {
    this.element = element;
    this.offset = options || 0;
    this.affixed = null;
    this.unpin = null;
    this.pinnedOffset = null;
    this.checkPosition();
    window.addEventListener('scroll', this.checkPosition.bind(this));
    window.addEventListener('click', this.checkPositionWithEventLoop.bind(this));
    window.matchMedia('(min-width: 992px)').addListener(event => {
      if (event.matches) {
        this.offset = NexT.utils.getAffixParam();
        this.checkPosition();
      }
    });
  },
  getState: function(scrollHeight, height, offsetTop, offsetBottom) {
    let scrollTop = window.scrollY;
    let targetHeight = window.innerHeight;
    if (offsetTop != null && this.affixed === 'top') return scrollTop < offsetTop ? 'top' : false;
    if (this.affixed === 'bottom') {
      if (offsetTop != null) return this.unpin <= this.element.getBoundingClientRect().top ? false : 'bottom';
      return scrollTop + targetHeight <= scrollHeight - offsetBottom ? false : 'bottom';
    }
    let initializing = this.affixed === null;
    let colliderTop = initializing ? scrollTop : this.element.getBoundingClientRect().top + scrollTop;
    let colliderHeight = initializing ? targetHeight : height;
    if (offsetTop != null && scrollTop <= offsetTop) return 'top';
    if (offsetBottom != null && (colliderTop + colliderHeight >= scrollHeight - offsetBottom)) return 'bottom';
    return false;
  },
  getPinnedOffset: function() {
    if (this.pinnedOffset) return this.pinnedOffset;
    this.element.classList.remove('affix-top', 'affix-bottom');
    this.element.classList.add('affix');
    return (this.pinnedOffset = this.element.getBoundingClientRect().top);
  },
  checkPositionWithEventLoop() {
    setTimeout(this.checkPosition.bind(this), 1);
  },
  checkPosition: function() {
    if (window.getComputedStyle(this.element).display === 'none') return;
    let height = this.element.offsetHeight - CONFIG.sidebarPadding;
    let offset = this.offset;
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
      this.element.style.top = scrollHeight - height - offsetBottom + 'px';
    }
  }
};

NexT.utils.getAffixParam = function() {
  const sidebarOffset = CONFIG.sidebar.offset || 12;

  let headerOffset = document.querySelector('.header-inner').offsetHeight + sidebarOffset;
  let footer = document.querySelector('#footer');
  let footerInner = document.querySelector('.footer-inner');
  let footerMargin = footer.offsetHeight - footerInner.offsetHeight;
  let footerOffset = footer.offsetHeight + footerMargin;

  document.querySelector('.sidebar').style.marginTop = headerOffset + 'px';

  return {
    top   : headerOffset - sidebarOffset,
    bottom: footerOffset
  };
};

window.addEventListener('DOMContentLoaded', () => {

  Affix.init(document.querySelector('.sidebar-inner'), NexT.utils.getAffixParam());
});
