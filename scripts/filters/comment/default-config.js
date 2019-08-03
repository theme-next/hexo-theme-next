/* global hexo */

'use strict';

const path = require('path');

hexo.extend.filter.register('theme_inject', function(injects) {
  injects.comment.raws.forEach(element => {
    element.args[0] = Object.assign({
      class: path.basename(element.name, path.extname(element.name))
    }, element.args[0]);
  });
}, 99999);
