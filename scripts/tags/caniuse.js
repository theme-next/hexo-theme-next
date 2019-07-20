/**
 * caniuse.js | https://theme-next.org/docs/tag-plugins/caniuse
 */

/* global hexo */

'use strict';

const caniUse = (args) => {
  args = args.join('').split('@');
  let feature = args[0];
  let periods = args[1] || 'current';

  if (!feature) {
    hexo.log.w('Caniuse feature can NOT be empty');
    return '';
  }

  return `<p class="ciu_embed" data-feature="${feature}" data-periods="${periods}"><a id="non-ext" href="http://caniuse.com/#feat=${feature}">Can I Use ${feature}?</a>Data on support for the ${feature} feature across the major browsers from caniuse.com.</p>`;
};

hexo.extend.tag.register('caniuse', caniUse, {async: true});
