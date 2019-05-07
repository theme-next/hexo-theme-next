/* global hexo */

'use strict';

hexo.extend.filter.register('theme_inject', function (injects) {
  let custom_file_path = hexo.theme.config.custom_file_path;
  if (custom_file_path) {
    if (custom_file_path.head) {
      injects.head.file('custom', custom_file_path.head);
    }
    if (custom_file_path.header) {
      injects.header.file('custom', custom_file_path.header);
    }
    if (custom_file_path.sidebar) {
      injects.sidebar.file('custom', custom_file_path.sidebar);
    }
  }
});