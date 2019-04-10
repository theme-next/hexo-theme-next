/* global hexo */

'use strict';

hexo.extend.filter.register('before_generate', function(data) {
    setEmptyCommentsViews('count.swig');
    setEmptyCommentsViews('index.swig');
});

function setEmptyCommentsViews(fileName) {
    let config = hexo.theme.config.comments;
    if (!config.type) {
        return;
    }
    let viewPath = `_third-party/comments/${config.type}/${fileName}`
    let view = hexo.theme.getView(`_third-party/comments/${config.type}/${fileName}`);
    if (!view) {
        hexo.theme.setView(viewPath, '');
    }
}
