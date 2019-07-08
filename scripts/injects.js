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

// Init injects
function initInject() {
  let injects = {};
  points.styles.forEach((item) => {
    injects[item] = new StylusInject();
  });
  points.views.forEach((item) => {
    injects[item] = new ViewInject();
  });
  return injects;
}

module.exports = function(hexo) {
  // Exec theme_inject filter
  let injects = initInject();
  hexo.execFilterSync('theme_inject', injects);
  hexo.theme.config.injects = {};

  // Inject stylus, and get relative path base on hexo dir.
  points.styles.forEach((type) => {
    hexo.theme.config.injects[type] = injects[type].files.map((item) => path.relative(hexo.base_dir, item));
  });

  // Inject views
  points.views.forEach((type) => {
    hexo.theme.config.injects[type] = [];
    injects[type].raws.forEach((injectObj) => {
      // If there is no suffix, will add `.swig`
      if (injectObj.name.indexOf('.') < 0) {
        injectObj.name += '.swig';
      }
      let viewName = `inject/${type}/${injectObj.name}`;
      hexo.theme.setView(viewName, injectObj.raw);
      hexo.theme.config.injects[type].push({
        layout: viewName,
        locals: injectObj.args[0],
        options: injectObj.args[1]
      });
    });
  });
};
