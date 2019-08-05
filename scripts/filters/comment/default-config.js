/* global hexo */

'use strict';

const path = require('path');

hexo.extend.filter.register('theme_inject', injects => {
  injects.comment.raws.forEach(element => {
    // Set default button content
    let injectName = path.basename(element.name, path.extname(element.name));
    element.args[0] = Object.assign({
      class: injectName,
      button: injectName
    }, element.args[0]);
    // Set custom button content
    let locals = element.args[0];
    let nav = hexo.theme.config.comments.nav;
    if (nav) {
      let customButton = nav[locals.class];
      if (customButton) {
        locals.button = customButton;
      }
    }
  });
}, 99999);
