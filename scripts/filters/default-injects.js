/* global hexo */

'use strict';

const points = require('./../injects-point');

hexo.extend.filter.register('theme_inject', (injects) => {
  let filePath = hexo.theme.config.custom_file_path;

  points.views.forEach((key) => {
    if (filePath[key]) {
      injects[key].file('custom', filePath[key]);
    }
  });

  points.styles.forEach((key) => {
    if (filePath[key]) {
      injects[key].push(filePath[key]);
    }
    // Compatible, but like head header etc, it shouldn't add 's' suffix.
    let oldKey = key + 's';
    if (filePath[oldKey]) {
      injects[key].push(filePath[oldKey]);
    }
  });

  // Compatible, but please use custom_file_path.
  if (hexo.theme.config.footer.custom_text) {
    injects.footer.raw('custom-text', `
    <div class="footer-custom">{{ theme.footer.custom_text }}</div>
    `, {}, {cache: true});
  }

}, 99);
