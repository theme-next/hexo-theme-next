/* global hexo */

'use strict';

hexo.extend.filter.register('theme_inject', function(injects) {
  if (injects.comment.raws.length > 1) {
    hexo.log.warn('It is currently not supported to launch mutli-comments systems at the same time, so stay tuned for subsequent versions of iteration.');
    hexo.log.warn('Please keep one of the following.');
    injects.comment.raws.forEach(element => {
      let commentName = element.name;
      // List comment system
      hexo.log.warn('  - ' + commentName);
      // Close comment system
      injects.postMeta.raw(commentName, '', {disableDefaultLayout: true}, {cache: true});
      injects.comment.raw(commentName, '', {}, {cache: true});
      injects.bodyEnd.raw(commentName, '', {}, {cache: true});
    });
  }
}, 999);
