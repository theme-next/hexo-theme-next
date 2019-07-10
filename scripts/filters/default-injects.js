/* global hexo */

'use strict';

const points = require('./../injects-point');

hexo.extend.filter.register('theme_inject', (injects) => {
  let filePath = hexo.theme.config.custom_file_path;

  if (!filePath) {
    return;
  }

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
      hexo.log.warn(`WARNING: Format. Please use 'custom_file_path.${key}' instead 'custom_file_path.${oldKey}'.`);
    }
  });

  // Compatible, but please use custom_file_path.
  if (hexo.theme.config.footer.custom_text) {
    injects.footer.raw('custom-text', `
    <div class="footer-custom">{{ theme.footer.custom_text }}</div>
    `, {}, {cache: true});
    hexo.log.warn(`WARNING: 'footer.custom_text' will not longer be supported. Please use 'custom_file_path.footer' instead`);
  }

}, 99);
