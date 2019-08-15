/* global CONFIG */

($ => {
  class Affix {
    constructor(element, options) {
      this.options = $.extend({
        offset: 0,
        target: window
      }, options);
      this.$target = $(this.options.target)
        .on('scroll.bs.affix.data-api', this.checkPosition.bind(this))
        .on('click.bs.affix.data-api', this.checkPositionWithEventLoop.bind(this));
      this.$element = $(element);
      this.affixed = null;
      this.unpin = null;
      this.pinnedOffset = null;
      this.checkPosition();
    }
    getState(scrollHeight, height, offsetTop, offsetBottom) {
      let scrollTop = this.$target.scrollTop();
      let position = this.$element.offset();
      let targetHeight = this.$target.height();
      if (offsetTop != null && this.affixed === 'top') return scrollTop < offsetTop ? 'top' : false;
      if (this.affixed === 'bottom') {
        if (offsetTop != null) return scrollTop + this.unpin <= position.top ? false : 'bottom';
        return scrollTop + targetHeight <= scrollHeight - offsetBottom ? false : 'bottom';
      }
      let initializing = this.affixed == null;
      let colliderTop = initializing ? scrollTop : position.top;
      let colliderHeight = initializing ? targetHeight : height;
      if (offsetTop != null && scrollTop <= offsetTop) return 'top';
      if (offsetBottom != null && (colliderTop + colliderHeight >= scrollHeight - offsetBottom)) return 'bottom';
      return false;
    }
    getPinnedOffset() {
      if (this.pinnedOffset) return this.pinnedOffset;
      this.$element.removeClass(Affix.RESET).addClass('affix');
      let scrollTop = this.$target.scrollTop();
      let position = this.$element.offset();
      return (this.pinnedOffset = position.top - scrollTop);
    }
    checkPositionWithEventLoop() {
      setTimeout(this.checkPosition.bind(this), 1);
    }
    checkPosition() {
      if (!this.$element.is(':visible')) return;
      let height = this.$element.height();
      let offset = this.options.offset;
      let offsetTop = offset.top;
      let offsetBottom = offset.bottom;
      let scrollHeight = Math.max($(document).height(), $(document.body).height());
      if (typeof offset !== 'object') offsetBottom = offsetTop = offset;
      if (typeof offsetTop === 'function') offsetTop = offset.top(this.$element);
      if (typeof offsetBottom === 'function') offsetBottom = offset.bottom(this.$element);
      let affix = this.getState(scrollHeight, height, offsetTop, offsetBottom);
      if (this.affixed !== affix) {
        if (this.unpin != null) this.$element.css('top', '');
        let affixType = 'affix' + (affix ? '-' + affix : '');
        let e = new $.Event(affixType + '.bs.affix');
        this.$element.trigger(e);
        if (e.isDefaultPrevented()) return;
        this.affixed = affix;
        this.unpin = affix === 'bottom' ? this.getPinnedOffset() : null;
        this.$element
          .removeClass(Affix.RESET)
          .addClass(affixType)
          .trigger(affixType.replace('affix', 'affixed') + '.bs.affix');
      }
      if (affix === 'bottom') {
        this.$element.offset({
          top: scrollHeight - height - offsetBottom
        });
      }
    }
  }

  Affix.RESET = 'affix affix-top affix-bottom';

  function Plugin(option) {
    return this.each(function() {
      let $this = $(this);
      let data = $this.data('bs.affix');
      let options = typeof option === 'object' && option;
      if (!data) $this.data('bs.affix', data = new Affix(this, options));
      if (typeof option === 'string') data[option]();
    });
  }

  $.fn.affix = Plugin;
  $.fn.affix.Constructor = Affix;
})(jQuery);

window.addEventListener('DOMContentLoaded', () => {
  const sidebarOffset = CONFIG.sidebar.offset || 12;
  const sidebarInner = document.querySelector('.sidebar-inner');

  const getHeaderOffset = () => document.querySelector('.header-inner').height() + sidebarOffset;

  const getFooterOffset = () => {
    let footer = document.querySelector('#footer');
    let footerInner = document.querySelector('.footer-inner');
    let footerMargin = footer.offsetHeight - footerInner.offsetHeight;
    let footerOffset = footer.offsetHeight + footerMargin;
    return footerOffset;
  };

  const initAffix = () => {
    let headerOffset = getHeaderOffset();
    let footerOffset = getFooterOffset();
    $('.sidebar-inner').affix({
      offset: {
        top   : headerOffset - sidebarOffset,
        bottom: footerOffset
      }
    });
    document.querySelector('#sidebar').css({
      'margin-top' : `${headerOffset}px`,
      'margin-left': 'auto'
    });
  };

  const resizeListener = () => {
    window.matchMedia('(min-width: 992px)').addListener(event => {
      if (event.matches) {
        $(window).off('.affix');
        $('.sidebar-inner').removeData('bs.affix');
        sidebarInner.classList.remove('affix', 'affix-top', 'affix-bottom');
        initAffix();
      }
    });
  };

  initAffix();
  resizeListener();
});
