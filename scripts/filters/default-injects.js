/* global hexo */

'use strict';

hexo.extend.filter.register('theme_inject', (injects) => {
  let filePath = hexo.theme.config.custom_file_path;
  if (filePath) {
    if (filePath.head) {
      injects.head.file('custom', filePath.head);
    }
    if (filePath.header) {
      injects.header.file('custom', filePath.header);
    }
    if (filePath.sidebar) {
      injects.sidebar.file('custom', filePath.sidebar);
    }
  }
});
