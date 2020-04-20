/* global hexo */

'use strict';

const url = require('url');

/**
 * Export theme config to js
 */
hexo.extend.helper.register('next_config', function() {
  let { config, theme, next_version } = this;
  config.algolia = config.algolia || {};
  let exportConfig = {
    hostname  : url.parse(config.url).hostname || config.url,
    root      : config.root,
    scheme    : theme.scheme,
    version   : next_version,
    exturl    : theme.exturl,
    sidebar   : theme.sidebar,
    copycode  : theme.codeblock.copy_button,
    back2top  : theme.back2top,
    bookmark  : theme.bookmark,
    fancybox  : theme.fancybox,
    mediumzoom: theme.mediumzoom,
    lazyload  : theme.lazyload,
    pangu     : theme.pangu,
    comments  : theme.comments,
    algolia   : {
      appID    : config.algolia.applicationID,
      apiKey   : config.algolia.apiKey,
      indexName: config.algolia.indexName,
      hits     : theme.algolia_search.hits,
      labels   : theme.algolia_search.labels
    },
    localsearch: theme.local_search,
    motion     : theme.motion
  };
  if (config.search) {
    exportConfig.path = config.search.path;
  }
  return `<script id="hexo-configurations">
    var NexT = window.NexT || {};
    var CONFIG = ${JSON.stringify(exportConfig)};
  </script>`;
});
