/**
 * include-raw.js | https://theme-next.org/docs/tag-plugins/
 */

/* global hexo */

'use strict';

const path = require('path');
const fs = require('hexo-fs');

function includeRaw(args) {
  var file = path.join(hexo.source_dir, args[0]);

  return fs.exists(file).then(exist => {
    if (!exist) {
      hexo.log.error('Include file not found!');
      return;
    }
    return fs.readFile(file).then(contents => {
      if (!contents) {
        hexo.log.warn('Include file empty.');
        return;
      }
      return contents;
    });
  });
}

hexo.extend.tag.register('include_raw', includeRaw, {ends: false, async: true});
