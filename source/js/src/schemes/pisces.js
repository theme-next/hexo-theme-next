/* global NexT, CONFIG */

$(document).ready(function() {

  var sidebarInner = $('.sidebar-inner');

  function getHeaderOffset() {
    return $('.header-inner').height() + CONFIG.sidebar.offset;
  }

  function getFooterOffset() {
    var footerInner = $('.footer-inner');
    var footerMargin = footerInner.outerHeight(true) - footerInner.outerHeight();
    var footerOffset = footerInner.outerHeight(true) + footerMargin;
    return footerOffset;
  }

  function setSidebarMarginTop(headerOffset) {
    return $('#sidebar').css({ 'margin-top': headerOffset });
  }

  function initAffix() {
    var headerOffset = getHeaderOffset();
    var footerOffset = getFooterOffset();
    var sidebarHeight = $('#sidebar').height() + NexT.utils.getSidebarb2tHeight();
    var contentHeight = $('#content').height();

    // Not affix if sidebar taller then content (to prevent bottom jumping).
    if (headerOffset + sidebarHeight < contentHeight) {
      sidebarInner.affix({
        offset: {
          top   : headerOffset - CONFIG.sidebar.offset,
          bottom: footerOffset
        }
      });
    }

    setSidebarMarginTop(headerOffset).css({ 'margin-left': 'initial' });
  }

  function recalculateAffixPosition() {
    $(window).off('.affix');
    sidebarInner.removeData('bs.affix').removeClass('affix affix-top affix-bottom');
    initAffix();
  }

  function resizeListener() {
    var mql = window.matchMedia('(min-width: 991px)');
    mql.addListener(function(e) {
      if (e.matches) {
        recalculateAffixPosition();
      }
    });
  }

  initAffix();
  resizeListener();

});
