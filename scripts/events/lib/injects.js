'use strict';

const fs = require('fs');
const path = require('path');
const points = require('./injects-point');
const defaultExtname = '.swig';

// Defining stylus types
class StylusInject {
  constructor(base_dir) {
    this.base_dir = base_dir;
    this.files = [];
  }
  push(file) {
    // Get absolute path base on hexo dir
    this.files.push(path.resolve(this.base_dir, file));
  }
}

// Defining view types
class ViewInject {
  constructor(base_dir) {
    this.base_dir = base_dir;
    this.raws = [];
  }
  raw(name, raw, ...args) {
    // Set default extname
    if (path.extname(name) === '') {
      name += defaultExtname;
    }
    this.raws.push({name, raw, args});
  }
  file(name, file, ...args) {
    // Set default extname from file's extname
    if (path.extname(name) === '') {
      name += path.extname(file);
    }
    // Get absolute path base on hexo dir
    this.raw(name, fs.readFileSync(path.resolve(this.base_dir, file), 'utf8'), ...args);
  }
}

// Init injects
function initInject(base_dir) {
  let injects = {};
  points.styles.forEach(item => {
    injects[item] = new StylusInject(base_dir);
  });
  points.views.forEach(item => {
    injects[item] = new ViewInject(base_dir);
  });
  return injects;
}

module.exports = hexo => {
  // Exec theme_inject filter
  let injects = initInject(hexo.base_dir);
  hexo.execFilterSync('theme_inject', injects);
  hexo.theme.config.injects = {};

  // Inject stylus
  points.styles.forEach(type => {
    hexo.theme.config.injects[type] = injects[type].files;
  });

  // Inject views
  points.views.forEach(type => {
    let configs = Object.create(null);
    hexo.theme.config.injects[type] = [];
    // Add or override view.
    injects[type].raws.forEach((injectObj, index) => {
      let name = `inject/${type}/${injectObj.name}`;
      hexo.theme.setView(name, injectObj.raw);
      configs[name] = {
        layout : name,
        locals : injectObj.args[0],
        options: injectObj.args[1],
        order  : injectObj.args[2] || index
      };
    });
    // Views sort.
    hexo.theme.config.injects[type] = Object.values(configs)
      .sort((x, y) => x.order - y.order);
  });
};
