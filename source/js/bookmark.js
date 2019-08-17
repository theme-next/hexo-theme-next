/* global CONFIG */

window.addEventListener('DOMContentLoaded', () => {
  'use strict';

  var link;

  var doSaveScroll = () => {
    localStorage.setItem('lastpage', location.pathname);
    localStorage.setItem('bookmark' + location.pathname, window.scrollY);
  };

  var scrollToMark = () => {
    var top = localStorage.getItem('bookmark' + location.pathname);
    top = parseInt(top, 10);
    // If the page opens with a specific hash, just jump out
    if (!isNaN(top) && location.hash !== '') {
      // Auto scroll to the position
      $(document.documentElement).animate({ 'scrollTop': top }, 'fast');
    }
  };
  // Register everything
  var init = function(trigger) {
    // Create a link element
    link = document.querySelector('.book-mark-link');
    // Scroll event
    window.addEventListener('scroll', () => {
      window.scrollY === 0 ? link.classList.add('book-mark-link-fixed') : link.classList.remove('book-mark-link-fixed');
    });
    // Register beforeunload event when the trigger is auto
    if (trigger === 'auto') {
      // Register beforeunload event
      addEventListener('beforeunload', doSaveScroll);
      addEventListener('pjax:send', doSaveScroll);
    }
    // Save the position by clicking the icon
    link.addEventListener('click', event => {
      event.preventDefault();
      localStorage.setItem('bookmark' + location.pathname, window.scrollY);
      $(link).animate({ top: -30 }, 'fast', () => {
        setTimeout(() => {
          link.style.top = '';
        }, 400);
      });
    });
    link.addEventListener('dblclick', () => {
      var lastpage = localStorage.getItem('lastpage');
      if (lastpage && lastpage !== location.pathname) {
        location.href = lastpage;
      }
    });
    scrollToMark();
    window.addEventListener('pjax:success', scrollToMark);
  };

  init(CONFIG.bookmark.save);
});
