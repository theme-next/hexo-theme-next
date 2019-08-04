/**
 * full-image.js | https://theme-next.org/docs/tag-plugins/full-image
 */

/* global hexo */

'use strict';

function fullImage(args) {
  hexo.log.warn('Full-image tag is no longer supported.');
  args = args.join(' ').split(',');
  var src = args[0];
  return `<img src="${src}">`;
}

hexo.extend.tag.register('fullimage', fullImage, {ends: false});
hexo.extend.tag.register('fi', fullImage, {ends: false});
