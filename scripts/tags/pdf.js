/**
 * pdf.js | https://theme-next.org/docs/tag-plugins/pdf
 */

/* global hexo */

'use strict';

function pdf(args) {
  let theme = hexo.theme.config;
  return `<div class="pdfobject-container" data-target="${args[0]}" data-height="${args[1] || theme.pdf.height}"></div>`;
}

hexo.extend.tag.register('pdf', pdf, {ends: false});
