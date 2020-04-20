/**
 * group-pictures.js | https://theme-next.org/docs/tag-plugins/group-pictures
 */

/* global hexo */

'use strict';

var LAYOUTS = {
  2: {
    1: [1, 1],
    2: [2]
  },
  3: {
    1: [3],
    2: [1, 2],
    3: [2, 1]
  },
  4: {
    1: [1, 2, 1],
    2: [1, 3],
    3: [2, 2],
    4: [3, 1]
  },
  5: {
    1: [1, 2, 2],
    2: [2, 1, 2],
    3: [2, 3],
    4: [3, 2]
  },
  6: {
    1: [1, 2, 3],
    2: [1, 3, 2],
    3: [2, 1, 3],
    4: [2, 2, 2],
    5: [3, 3]
  },
  7: {
    1: [1, 2, 2, 2],
    2: [1, 3, 3],
    3: [2, 2, 3],
    4: [2, 3, 2],
    5: [3, 2, 2]
  },
  8: {
    1: [1, 2, 2, 3],
    2: [1, 2, 3, 2],
    3: [1, 3, 2, 2],
    4: [2, 2, 2, 2],
    5: [2, 3, 3],
    6: [3, 2, 3],
    7: [3, 3, 2]
  },
  9: {
    1: [1, 2, 3, 3],
    2: [1, 3, 2, 3],
    3: [2, 2, 2, 3],
    4: [2, 2, 3, 2],
    5: [2, 3, 2, 2],
    6: [3, 2, 2, 2],
    7: [3, 3, 3]
  },
  10: {
    1: [1, 3, 3, 3],
    2: [2, 2, 3, 3],
    3: [2, 3, 2, 3],
    4: [2, 3, 3, 2],
    5: [3, 2, 2, 3],
    6: [3, 2, 3, 2],
    7: [3, 3, 2, 2]
  }
};

function groupBy(group, data) {
  var r = [];
  for (let count of group) {
    r.push(data.slice(0, count));
    data = data.slice(count);
  }
  return r;
}

var templates = {

  dispatch: function(pictures, group, layout) {
    var rule = LAYOUTS[group] ? LAYOUTS[group][layout] : null;
    return rule ? this.getHTML(groupBy(rule, pictures)) : templates.defaults(pictures);
  },

  /**
   * Defaults Layout
   *
   * □ □ □
   * □ □ □
   * ...
   *
   * @param pictures
   */
  defaults: function(pictures) {
    var ROW_SIZE = 3;
    var rows = pictures.length / ROW_SIZE;
    var pictureArr = [];

    for (var i = 0; i < rows; i++) {
      pictureArr.push(pictures.slice(i * ROW_SIZE, (i + 1) * ROW_SIZE));
    }

    return this.getHTML(pictureArr);
  },

  getHTML: function(rows) {
    var rowHTML = rows.map(row => {
      return `<div class="group-picture-row">${this.getColumnHTML(row)}</div>`;
    }).join('');

    return `<div class="group-picture-container">${rowHTML}</div>`;
  },

  getColumnHTML: function(pictures) {
    var columnWidth = 100 / pictures.length;
    var columnStyle = `style="width: ${columnWidth}%;"`;
    return pictures.map(picture => {
      return `<div class="group-picture-column" ${columnStyle}>${picture}</div>`;
    }).join('');
  }
};

function groupPicture(args, content) {
  args = args[0].split('-');
  var group = parseInt(args[0], 10);
  var layout = parseInt(args[1], 10);

  content = hexo.render.renderSync({text: content, engine: 'markdown'});

  var pictures = content.match(/<img[\s\S]*?>/g);

  return `<div class="group-picture">${templates.dispatch(pictures, group, layout)}</div>`;
}

hexo.extend.tag.register('grouppicture', groupPicture, {ends: true});
hexo.extend.tag.register('gp', groupPicture, {ends: true});
