/* global hexo */

'use strict';

const nunjucks = require('nunjucks');
const path = require('path');

function njkCompile(data) {
  const templateDir = path.dirname(data.path);
  const config = Object.assign({
    autoescape: false,
    watch: false
  }, hexo.config.nunjucks);
  const env = nunjucks.configure(templateDir, config);
  return nunjucks.compile(data.text, env, data.path);
}

function njkRenderer(data, locals, callback) {
  return njkCompile(data).render(locals, callback);
}

// Return a compiled renderer.
njkRenderer.compile = function(data) {
  const compiledTemplate = njkCompile(data);
  // Need a closure to keep the compiled template.
  return function(locals, callback) {
    return compiledTemplate.render(locals, callback);
  }
}

hexo.extend.renderer.register('njk', 'html', njkRenderer);
hexo.extend.renderer.register('swig', 'html', njkRenderer);
