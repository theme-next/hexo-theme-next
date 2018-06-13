(function (global) {
  'use strict';

  var storage = global.localStorage;
  if (storage == null) {
    // if the localStorage is not exists
    storage = {
      // eslint-disable-next-line
      getItem: function () { return null },
      setItem: function () { },
      removeItem: function () { },
      clear: function () { },
    };
  }

  // get the saved bookmark object
  var getBookmark = function () {
    var mark = storage.getItem('bookmark');
    if (mark == null) {
      return null;
    }
    try {
      return JSON.parse(mark);
    } catch (e) {
      // invalid object saved in the storage
      // console.warn('Invalid bookmark object.');
      return null;
    }
  };

  var link;
  // register everything
  var init = function () {
    // bookmark-link style
    var style = global.document.createElement('style');
    style.type = 'text/css';
    var text = '.book-mark-link{'
      + 'border-bottom:none;'
      + 'display:block;'
      + 'position:fixed;'
      + 'color:#222;'
      + 'font-size:26px !important;'
      + 'top:-10px;left:20px;'
      + 'transition:.3s;'
      + '}'
      + '.book-mark-link:hover,.book-mark-link-fixed{top:-2px}'
      // do not show when the width is not enough
      + '@media(max-width:1090px){.book-mark-link{display:none}}';
    text = global.document.createTextNode(text);
    style.appendChild(text);
    global.document.head.appendChild(style);

    // create a link element
    // eslint-disable-next-line max-len
    link = $('<a class="book-mark-link book-mark-link-fixed fa fa-bookmark" href="#"></a>');
    $(global.document.body).append(link);

    var currentTop = 0;
    // scroll event
    $(global).on('scroll.bookmark', function () {
      var top = global.document.documentElement.scrollTop;
      if (top > 0) {
        if (currentTop === 0) {
          link.removeClass('book-mark-link-fixed');
          currentTop = top;
        }
      } else {
        if (currentTop > 0) {
          !link.hasClass('book-mark-link-fixed') &&
            link.addClass('book-mark-link-fixed');
          currentTop = 0;
        }
      }
    });
  };

  var loadBookmark = function () {
    var mark = getBookmark();
    if (mark == null) {
      return;
    }
    // found the bookmark
    $(function () {
      init();
      link.attr('href', mark.lastUri + '#book:mark');
    });
  };

  var doScroll = function (top) {
    if (!isNaN(top)) {
      $(function () {
        // eslint-disable-next-line max-len
        $(global.document.documentElement).animate({ 'scrollTop': top }, 'fast');
      });
    }
  };

  var doSaveScroll = function (path, mark) {
    if (mark == null) {
      mark = {};
    }
    var top = global.document.documentElement.scrollTop;
    mark.lastUri = path;
    mark[path] = top;
    storage.setItem('bookmark', JSON.stringify(mark));
    link.animate({ top: -26 }, 'fast', function () {
      setTimeout(function () {
        link.css('top', '');
      }, 400);
    });
    return mark;
  };

  var scrollToMark = function (trigger, hash) {
    var path = global.location.pathname;
    var mark = getBookmark();
    $(function () {
      init();
      // save the position by clicking the icon
      link.click(function () {
        mark = doSaveScroll(path, mark);
        return false;
      });

      // register beforeunload event when the trigger is auto
      if (trigger === 'auto') {
        // register beforeunload event
        global.addEventListener('beforeunload', function () {
          doSaveScroll(path, mark);
        });
      }
      // auto scroll to the position
      if (mark == null) {
        return;
      }
      // and if the page opens with a specific hash, just jump out
      var skips = [hash, '#comments'];
      // eslint-disable-next-line
      if (skips.filter(function (h) { return h === global.location.hash }).length > 0) {
        return;
      }
      doScroll(mark[path]);
    });
  };

  global.bookmark = {
    loadBookmark: loadBookmark,
    scrollToMark: scrollToMark,
  };
})(window);
