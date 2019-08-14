/* global CONFIG */

window.addEventListener('DOMContentLoaded', () => {

  const sidebarOffset = CONFIG.sidebar.offset || 12;
  const sidebarInner = document.querySelector('.sidebar-inner');
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

    document.querySelector('#sidebar').setAttribute('style', `margin-top: ${headerOffset}px; margin-left: auto`);
  };

  const recalculateAffixPosition = () => {
    window.removeEventListener('.affix', () => {});
    sidebarInner.removeAttribute('bs.affix');
    sidebarInner.classList.remove('affix affix-top affix-bottom');
    initAffix();
  };

  const resizeListener = () => {
    let mql = window.matchMedia('(min-width: 992px)');
    mql.addListener(event => {
      if (event.matches) {
        recalculateAffixPosition();
      }
    });
  };

  initAffix();
  resizeListener();
});
