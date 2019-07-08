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

}, 99);
