/* global CONFIG */

window.addEventListener('DOMContentLoaded', () => {

  var sidebarOffset = CONFIG.sidebar.offset || 12;

  //const getHeaderOffset = () => $('.header-inner').height() + sidebarOffset;
  const getHeaderOffset = () => parseFloat(getComputedStyle(document.querySelector('.header-inner'), null).height.replace('px', '')) + sidebarOffset;
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

    document.querySelector('#sidebar').setAttribute('style', 'margin-top: headerOffset; margin-left: auto');
  };

  const recalculateAffixPosition = () => {
    $(window).off('.affix');
    $('.sidebar-inner').removeData('bs.affix').removeClass('affix affix-top affix-bottom');
    initAffix();
  };

  const resizeListener = () => {
    var mql = window.matchMedia('(min-width: 992px)');
    mql.addListener(event => {
      if (event.matches) {
        recalculateAffixPosition();
      }
    });
  };

  initAffix();
  resizeListener();
});
