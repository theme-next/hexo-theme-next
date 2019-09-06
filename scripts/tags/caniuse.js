/**
 * caniuse.js | https://theme-next.org/docs/tag-plugins/caniuse
 */

/* global hexo */

'use strict';

function caniUse(args) {
  args = args.join('').split('@');
  var feature = args[0];
  var periods = args[1] || 'current';

  if (!feature) {
    hexo.log.warn('Caniuse feature can NOT be empty.');
    return '';
  }

  return `<iframe data-feature="${feature}" src="https://caniuse.bitsofco.de/embed/index.html?feat=${feature}&periods=${periods}&accessible-colours=false" frameborder="0" width="100%" height="400px"></iframe>`;
}

hexo.extend.tag.register('caniuse', caniUse, {async: true});
hexo.extend.tag.register('can', caniUse, {async: true});
