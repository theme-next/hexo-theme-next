'use strict';

const fs = require('fs');
const path = require('path');
const points = require('./injects-point');

// Defining stylus types
class StylusInject {
  constructor() {
    this.files = [];
  }
  push(file) {
    this.files.push(file);
  }
}

// Defining view types
class ViewInject {
  constructor() {
    this.raws = [];
  }
  raw(name, raw, ...args) {
    this.raws.push({name, raw, args});
  }
  file(name, file, ...args) {
    this.raw(name, fs.readFileSync(file, 'utf8'), ...args);
  }
}

// Init injects
function initInject() {
  let injects = {};
  points.styles.forEach(item => {
    injects[item] = new StylusInject();
  });
  points.views.forEach(item => {
    injects[item] = new ViewInject();
  });
  return injects;
}

module.exports = hexo => {
  // Exec theme_inject filter
  let injects = initInject();
  hexo.execFilterSync('theme_inject', injects);
  hexo.theme.config.injects = {};

  // Inject stylus, and get absolute path base on hexo dir.
  points.styles.forEach(type => {
    hexo.theme.config.injects[type] = injects[type].files.map(item => path.resolve(hexo.base_dir, item));
  });

  // Inject views
  points.views.forEach(type => {
    let configs = Object.create(null);
    hexo.theme.config.injects[type] = [];
    injects[type].raws.forEach((injectObj, index) => {
      // If there is no suffix, will add `.swig`.
      if (injectObj.name.indexOf('.') < 0) {
        injectObj.name += '.swig';
      }
      let name = `inject/${type}/${injectObj.name}`;
      // Add or override view.
      hexo.theme.setView(name, injectObj.raw);
      configs[name] = {
        layout : name,
        locals : injectObj.args[0],
        options: injectObj.args[1],
        order  : injectObj.args[2] || index
      };
    });
    hexo.theme.config.injects[type] = Object.values(configs)
      .sort((x, y) => x.order - y.order);
  });
};
