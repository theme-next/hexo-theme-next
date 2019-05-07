/* global hexo */

'use strict';

const fs = require('fs');

class Inject {
  constructor() {
    this.raws = [];
  }
  raw(name, raw, ...args) {
    this.raws.push({
      name,
      raw,
      args
    });
  }
  file(name, file, ...args) {
    this.raws.push({
      name,
      raw: fs.readFileSync(file).toString(),
      args
    });
  }
}

const injectType = ['head', 'header', 'sidebar'];

const injects = {};
injectType.forEach((item) => {
  injects[item] = new Inject();
});

hexo.on('generateBefore', function() {

  hexo.execFilterSync('theme_inject', injects);
  hexo.theme.config.injects = {};
  injectType.forEach((type) => {
    hexo.theme.config.injects[type] = {};
    injects[type].raws.forEach((injectObj) => {
      let viewName = `inject/${type}/${injectObj.name}.swig`;
      hexo.theme.setView(viewName, injectObj.raw);
      hexo.theme.config.injects[type][injectObj.name] = {
        layout: viewName,
        locals: injectObj.args[0],
        options: injectObj.args[1]
      };
    });
  });

});
