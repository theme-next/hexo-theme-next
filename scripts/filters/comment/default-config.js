/* global hexo */

'use strict';

const path = require('path');

hexo.extend.filter.register('theme_inject', injects => {
  injects.comment.raws.forEach(element => {
    // Set default button content
    let injectName = path.basename(element.name, path.extname(element.name));
    element.args[0] = Object.assign({
      configKey: injectName,
      class    : injectName,
      button   : injectName
    }, element.args[0]);
    // Get locals and config
    let locals = element.args[0];
    let config = hexo.theme.config.comments;
    // Set activeClass
    if (config.active === locals.configKey) {
      config.activeClass = locals.class;
    }
    // Set custom button content
    if (config.nav) {
      let nav = config.nav[locals.configKey] || {};
      if (nav.order) {
        element.args[2] = nav.order;
      }
      if (nav.text) {
        locals.button = nav.text;
      }
    }
  });
}, 99999);
