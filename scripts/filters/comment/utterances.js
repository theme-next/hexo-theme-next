/* global hexo */

'use strict';

const path = require('path');

// Add comment
hexo.extend.filter.register('theme_inject', injects => {
  let theme = hexo.theme.config;
  if (!theme.utterances.enable) return;

  injects.comment.raw('utterances', `
  {% if page.comments %}
  <div class="comments">
  <script src="{{theme.utterances.cdn}}"
        repo="{{theme.utterances.repo}}"
        issue-term="{{theme.utterances.pathname}}"
        theme="{{theme.utterances.theme}}"
        crossorigin="anonymous"
        async>
    </script>
  </div>
  {% endif %}
  `);

});
