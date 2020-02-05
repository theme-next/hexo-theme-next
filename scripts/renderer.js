/* global hexo */

'use strict';

const nunjucks = require('nunjucks');
const path = require('path');

function njkCompile(data) {
  const templateDir = path.dirname(data.path);
  const env = nunjucks.configure(templateDir, {
    autoescape: false
  });
  env.addFilter('attr', (dictionary, key, value) => {
    dictionary[key] = value;
    return dictionary;
  });
  env.addFilter('json', dictionary => {
    return JSON.stringify(dictionary || '');
  });
  return nunjucks.compile(data.text, env, data.path);
}

function njkRenderer(data, locals) {
  return njkCompile(data).render(locals);
}

// Return a compiled renderer.
njkRenderer.compile = function(data) {
  const compiledTemplate = njkCompile(data);
  // Need a closure to keep the compiled template.
  return function(locals) {
    return compiledTemplate.render(locals);
  };
};

hexo.extend.renderer.register('njk', 'html', njkRenderer);
hexo.extend.renderer.register('swig', 'html', njkRenderer);
