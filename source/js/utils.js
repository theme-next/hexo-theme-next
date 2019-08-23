/* global NexT, CONFIG */

HTMLElement.prototype.isVisible = function() {
  return window.getComputedStyle(this).display !== 'none';
};

HTMLElement.prototype.width = function() {
  return parseFloat(window.getComputedStyle(this).width);
};

HTMLElement.prototype.height = function() {
  return parseFloat(window.getComputedStyle(this).height);
};

HTMLElement.prototype.outerHeight = function(flag) {
  var height = this.offsetHeight;
  if (!flag) return height;
  var style = window.getComputedStyle(this);
  height += parseInt(style.marginTop, 10) + parseInt(style.marginBottom, 10);
  return height;
};

HTMLElement.prototype.css = function(dict) {
  for (var key in dict) {
    this.style[key] = dict[key];
  }
  return this;
};

NexT.utils = {

  /**
   * Wrap images with fancybox.
   */
  wrapImageWithFancyBox: function() {
    document.querySelectorAll('.post-body :not(a) > img').forEach(element => {
      var $image = $(element);
      var imageLink = $image.attr('data-src') || $image.attr('src');
      var $imageWrapLink = $image.wrap(`<a class="fancybox fancybox.image" href="${imageLink}" itemscope itemtype="http://schema.org/ImageObject" itemprop="url"></a>`).parent('a');
      if ($image.is('.post-gallery img')) {
        $imageWrapLink.addClass('post-gallery-img');
        $imageWrapLink.attr('data-fancybox', 'gallery').attr('rel', 'gallery');
      } else if ($image.is('.group-picture img')) {
        $imageWrapLink.attr('data-fancybox', 'group').attr('rel', 'group');
      } else {
        $imageWrapLink.attr('data-fancybox', 'default').attr('rel', 'default');
      }

      var imageTitle = $image.attr('title') || $image.attr('alt');
      if (imageTitle) {
        $imageWrapLink.append(`<p class="image-caption">${imageTitle}</p>`);
        // Make sure img title tag will show correctly in fancybox
        $imageWrapLink.attr('title', imageTitle).attr('data-caption', imageTitle);
      }
    });

    $.fancybox.defaults.hash = false;
    $('.fancybox').fancybox({
      loop   : true,
      helpers: {
        overlay: {
          locked: false
        }
      }
    });
  },

  registerExtURL: function() {
    document.querySelectorAll('.exturl').forEach(element => {
      element.addEventListener('click', event => {
        var $exturl = event.currentTarget.getAttribute('data-url');
        var $decurl = decodeURIComponent(escape(window.atob($exturl)));
        window.open($decurl, '_blank', 'noopener');
        return false;
      });
    });
  },

  /**
   * One-click copy code support.
   */
  registerCopyCode: function() {
    $('.highlight').not('.gist .highlight').each((i, e) => {
      function initButton(button) {
        if (CONFIG.copycode.style === 'mac') {
          button.html('<i class="fa fa-clipboard"></i>');
        } else {
          button.text(CONFIG.translation.copy_button);
        }
      }
      var $button = $('<div>').addClass('copy-btn');
      $button.on('click', event => {
        var code = [...event.currentTarget.parentNode.querySelectorAll('.code .line')].map(element => {
          return element.innerText;
        }).join('\n');
        var ta = document.createElement('textarea');
        var yPosition = window.scrollY;
        ta.style.top = yPosition + 'px'; // Prevent page scrolling
        ta.style.position = 'absolute';
        ta.style.opacity = '0';
        ta.readOnly = true;
        ta.value = code;
        document.body.appendChild(ta);
        const selection = document.getSelection();
        const selected = selection.rangeCount > 0 ? selection.getRangeAt(0) : false;
        ta.select();
        ta.setSelectionRange(0, code.length);
        ta.readOnly = false;
        var result = document.execCommand('copy');
        if (CONFIG.copycode.show_result) {
          event.currentTarget.innerText = result ? CONFIG.translation.copy_success : CONFIG.translation.copy_failure;
        }
        ta.blur(); // For iOS
        event.currentTarget.blur();
        if (selected) {
          selection.removeAllRanges();
          selection.addRange(selected);
        }
        document.body.removeChild(ta);
      });
      $button.on('mouseleave', event => {
        setTimeout(() => {
          initButton($(event.currentTarget));
        }, 300);
      });
      initButton($button);
      $(e).wrap($('<div>').addClass('highlight-wrap')).after($button);
    });
  },

  registerScrollPercent: function() {
    var THRESHOLD = 50;
    var backToTop = document.querySelector('.back-to-top');
    var readingProgressBar = document.querySelector('.reading-progress-bar');
    // For init back to top in sidebar if page was scrolled after page refresh.
    $(window).on('load scroll', () => {
      var scrollPercent;
      if (backToTop || readingProgressBar) {
        var docHeight = document.querySelector('.container').height();
        var winHeight = window.innerHeight;
        var contentVisibilityHeight = docHeight > winHeight ? docHeight - winHeight : document.body.scrollHeight - winHeight;
        var scrollPercentRounded = Math.round(100 * window.scrollY / contentVisibilityHeight);
        scrollPercent = Math.min(scrollPercentRounded, 100) + '%';
      }
      if (backToTop) {
        window.scrollY > THRESHOLD ? backToTop.classList.add('back-to-top-on') : backToTop.classList.remove('back-to-top-on');
        backToTop.querySelector('span').innerText = scrollPercent;
      }
      if (readingProgressBar) {
        readingProgressBar.style.width = scrollPercent;
      }
    });

    backToTop && backToTop.addEventListener('click', () => {
      $(document.documentElement).animate({
        scrollTop: 0
      });
    });
  },

  /**
   * Tabs tag listener (without twitter bootstrap).
   */
  registerTabsTag: function() {
    // Binding `nav-tabs` & `tab-content` by real time permalink changing.
    $('.tabs ul.nav-tabs .tab').on('click', event => {
      event.preventDefault();
      // Prevent selected tab to select again.
      if (!event.currentTarget.classList.contains('active')) {
        // Add & Remove active class on `nav-tabs` & `tab-content`.
        [...event.currentTarget.parentNode.children].forEach(item => {
          item.classList.remove('active');
        });
        event.currentTarget.classList.add('active');
        var tActive = event.currentTarget.querySelector('a').getAttribute('href');
        tActive = document.querySelector(tActive);
        [...tActive.parentNode.children].forEach(item => {
          item.classList.remove('active');
        });
        tActive.classList.add('active');
        // Trigger event
        tActive.dispatchEvent(new Event('tabs:click', {
          bubbles: true
        }));
      }
    });

    window.dispatchEvent(new Event('tabs:register'));
  },

  registerCanIUseTag: function() {
    // GET RESPONSIVE HEIGHT PASSED FROM IFRAME
    window.addEventListener('message', e => {
      var data = e.data;
      if ((typeof data === 'string') && (data.indexOf('ciu_embed') > -1)) {
        var featureID = data.split(':')[1];
        var height = data.split(':')[2];
        $(`iframe[data-feature=${featureID}]`).height(parseInt(height, 10) + 30);
      }
    }, false);
  },

  registerActiveMenuItem: function() {
    document.querySelectorAll('.menu-item').forEach(element => {
      var target = element.querySelector('a[href]');
      var isSamePath = target.pathname === location.pathname || target.pathname === location.pathname.replace('index.html', '');
      var isSubPath = target.pathname !== '/' && location.pathname.indexOf(target.pathname) === 0;
      if (target.hostname === location.hostname && (isSamePath || isSubPath)) {
        element.classList.add('menu-item-active');
      } else {
        element.classList.remove('menu-item-active');
      }
    });
  },

  /**
   * Transform embedded video to support responsive layout.
   * @see http://toddmotto.com/fluid-and-responsive-youtube-and-vimeo-videos-with-fluidvids-js/
   */
  embeddedVideoTransformer: function() {
    // Supported Players. Extend this if you need more players.
    var SUPPORTED_PLAYERS = [
      'www.youtube.com',
      'player.vimeo.com',
      'player.youku.com',
      'music.163.com',
      'www.tudou.com'
    ];
    var pattern = new RegExp(SUPPORTED_PLAYERS.join('|'));

    function getDimension(element) {
      return {
        width : element.width(),
        height: element.height()
      };
    }

    function getAspectRadio(width, height) {
      return height / width * 100;
    }

    document.querySelectorAll('iframe').forEach(iframe => {
      var oldDimension = getDimension(iframe);
      var newDimension;

      if (iframe.src.search(pattern) > 0) {

        // Calculate the video ratio based on the iframe's w/h dimensions
        var videoRatio = getAspectRadio(oldDimension.width, oldDimension.height);

        // Replace the iframe's dimensions and position the iframe absolute
        // This is the trick to emulate the video ratio
        iframe.css({
          width   : '100%',
          height  : '100%',
          position: 'absolute',
          top     : '0',
          left    : '0'
        });

        // Wrap the iframe in a new <div> which uses a dynamically fetched padding-top property
        // based on the video's w/h dimensions
        var wrap = document.createElement('div');
        wrap.className = 'fluid-vids';
        wrap.style.position = 'relative';
        wrap.style.marginBottom = '20px';
        wrap.style.width = '100%';
        wrap.style.paddingTop = videoRatio + '%';
        // Fix for appear inside tabs tag.
        (wrap.style.paddingTop === '') && (wrap.style.paddingTop = '50%');

        // Add the iframe inside our newly created <div>
        var iframeParent = iframe.parentNode;
        iframeParent.insertBefore(wrap, iframe);
        wrap.appendChild(iframe);

        // Additional adjustments for 163 Music
        if (iframe.src.search('music.163.com') > 0) {
          newDimension = getDimension(iframe);
          var shouldRecalculateAspect = newDimension.width > oldDimension.width
                                     || newDimension.height < oldDimension.height;

          // 163 Music Player has a fixed height, so we need to reset the aspect radio
          if (shouldRecalculateAspect) {
            wrap.style.paddingTop = getAspectRadio(newDimension.width, oldDimension.height) + '%';
          }
        }
      }
    });
  },

  hasMobileUA: function() {
    var ua = navigator.userAgent;
    var pa = /iPad|iPhone|Android|Opera Mini|BlackBerry|webOS|UCWEB|Blazer|PSP|IEMobile|Symbian/g;

    return pa.test(ua);
  },

  isTablet: function() {
    return window.screen.width < 992 && window.screen.width > 767 && this.hasMobileUA();
  },

  isMobile: function() {
    return window.screen.width < 767 && this.hasMobileUA();
  },

  isDesktop: function() {
    return !this.isTablet() && !this.isMobile();
  },

  isMuse: function() {
    return CONFIG.scheme === 'Muse';
  },

  isMist: function() {
    return CONFIG.scheme === 'Mist';
  },

  isPisces: function() {
    return CONFIG.scheme === 'Pisces';
  },

  isGemini: function() {
    return CONFIG.scheme === 'Gemini';
  },

  /**
   * Escape meta symbols in jQuery selectors.
   *
   * @param selector
   * @returns {string|void|XML|*}
   */
  escapeSelector: function(selector) {
    return selector.replace(/[!"$%&'()*+,./:;<=>?@[\\\]^`{|}~]/g, '\\$&');
  },

  /**
   * Init Sidebar & TOC inner dimensions on all pages and for all schemes.
   * Need for Sidebar/TOC inner scrolling if content taller then viewport.
   */
  initSidebarDimension: function() {
    var sidebarInner = $('.sidebar-inner');
    var sidebarPadding = sidebarInner.innerWidth() - sidebarInner.width();
    var sidebarNavHeight = $('.sidebar-nav').css('display') === 'block' ? $('.sidebar-nav').outerHeight(true) : 0;
    var sidebarOffset = CONFIG.sidebar.offset || 12;
    var sidebarb2tHeight = CONFIG.back2top.enable && CONFIG.back2top.sidebar ? document.querySelector('.back-to-top').height() : sidebarOffset;
    var sidebarSchemePadding = NexT.utils.isPisces() || NexT.utils.isGemini()
      ? (sidebarPadding * 2) + sidebarNavHeight + sidebarOffset + sidebarb2tHeight
      : (sidebarPadding * 2) + (sidebarNavHeight / 2);
    // Initialize Sidebar & TOC Height.
    var sidebarWrapperHeight = document.body.clientHeight - sidebarSchemePadding;
    $('.site-overview-wrap, .post-toc-wrap').css('max-height', sidebarWrapperHeight);
  },

  updateSidebarPosition: function() {
    if (!this.isDesktop() || this.isPisces() || this.isGemini()) {
      this.initSidebarDimension();
      return;
    }
    // Expand sidebar on post detail page by default, when post has a toc.
    var $tocContent = $('.post-toc-content');
    var display = CONFIG.page.sidebar;
    if (typeof display !== 'boolean') {
      // There's no definition sidebar in the page front-matter
      var hasTOC = $tocContent.length > 0 && $tocContent.html().trim().length > 0;
      display = CONFIG.sidebar.display === 'always' || (CONFIG.sidebar.display === 'post' && hasTOC);
    }
    if (display) {
      window.dispatchEvent(new Event('sidebar:show'));
    }
  },

  getScript: function(url, callback, condition) {
    if (condition) {
      callback();
    } else {
      $.ajax({
        url     : url,
        dataType: 'script',
        cache   : true
      }).then(callback);
    }
  }
};
