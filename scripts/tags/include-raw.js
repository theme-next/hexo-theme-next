/**
 * include.js | global hexo script.
 *
 * Usage:
 *
 * {% include_raw '_data/path/to/file.html' %}
 *
 * Path is relative to your site source directory.
 */

/* global hexo */

'use strict';

var pathFn = require('path');
var fs = require('hexo-fs');

function include_raw(args) {
  var path = pathFn.join(hexo.source_dir, args[0]);

  return fs.exists(path).then(function(exist) {
    if (!exist) {
      hexo.log.error('Include file not found!');
      return;
    }
    return fs.readFile(path).then(function(contents) {
      if (!contents) {
        hexo.log.warn('Include file empty.');
        return;
      }
      return contents;
    });
  });
}

hexo.extend.tag.register('include_raw', include_raw, {ends: false, async: true});
