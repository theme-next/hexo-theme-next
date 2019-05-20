'use strict';

const fs = require('fs');

const injectType = ['head', 'header', 'sidebar'];

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
    this.raw.apply(this, [name, fs.readFileSync(file).toString()].concat(args));
  }
}

const injects = {};
injectType.forEach((item) => {
  injects[item] = new Inject();
});

module.exports = function(hexo) {
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
};
