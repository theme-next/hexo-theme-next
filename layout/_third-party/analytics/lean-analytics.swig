{%- if theme.leancloud_visitors.enable and !theme.valine.visitor %}
  {# custom analytics part create by xiamo; edited by LEAFERx #}
  <script{{ pjax }}>
  if (CONFIG.page.isPost) {
    function addCount(Counter) {
      var $visitors = document.querySelector('.leancloud_visitors');
      var url = $visitors.getAttribute('id').trim();
      var title = $visitors.getAttribute('data-flag-title').trim();

      Counter('get', '/classes/Counter', { where: JSON.stringify({ url }) })
        .done(function({ results }) {
          if (results.length > 0) {
            var counter = results[0];
            {%- if theme.leancloud_visitors.betterPerformance %}
              document.querySelector(`#${url} .leancloud-visitors-count`).innerText = counter.time + 1;
            {%- endif %}
            Counter('put', '/classes/Counter/' + counter.objectId, JSON.stringify({ time: { '__op': 'Increment', 'amount': 1 } }))
            {%- if not theme.leancloud_visitors.betterPerformance %}
              .done(function() {
                document.querySelector(`#${url} .leancloud-visitors-count`).innerText = counter.time + 1;
              })
            {%- endif %}
              .fail(function ({ responseJSON }) {
                console.log(`Failed to save Visitor num, with error message: ${responseJSON.error}`);
              })
          } else {
            {%- if theme.leancloud_visitors.security %}
              document.querySelector(`#${url} .leancloud-visitors-count`).innerText = 'Counter not initialized! More info at console err msg.';
              console.error('ATTENTION! LeanCloud counter has security bug, see how to solve it here: https://github.com/theme-next/hexo-leancloud-counter-security. \n However, you can still use LeanCloud without security, by setting `security` option to `false`.');
            {% else %}
              Counter('post', '/classes/Counter', JSON.stringify({ title: title, url: url, time: 1 }))
                .done(function() {
                  document.querySelector(`#${url} .leancloud-visitors-count`).innerText = 1;
                })
                .fail(function() {
                  console.log('Failed to create');
                });
            {%- endif %}
          }
        })
        .fail(function ({ responseJSON }) {
          console.log(`LeanCloud Counter Error: ${responseJSON.code} ${responseJSON.error}`);
        });
    }
  } else {
    function showTime(Counter) {
      var entries = [];
      var $visitors = document.querySelectorAll('.leancloud_visitors');

      $visitors.forEach(o => {
        entries.push(o.getAttribute('id').trim());
      });

      Counter('get', '/classes/Counter', { where: JSON.stringify({ url: { '$in': entries } }) })
        .done(results => {
          var COUNT_CONTAINER_REF = '.leancloud-visitors-count';

          if (results.length === 0) {
            document.querySelectorAll('.leancloud_visitors .leancloud-visitors-count').forEach(o => {
              o.innerText = 0;
            });
            return;
          }

          for (var i = 0; i < results.length; i++) {
            var item = results[i];
            var url = item.url;
            var time = item.time;
            document.querySelector(`#${url} .leancloud-visitors-count`).innerText = time;
          }
          for (var i = 0; i < entries.length; i++) {
            var url = entries[i];
            var element = document.querySelector(`#${url} .leancloud-visitors-count`);
            if (element.innerText == '') {
              element.innerText = 0;
            }
          }
        })
        .fail(responseJSON => {
          console.log(`LeanCloud Counter Error: ${responseJSON.code} ${responseJSON.error}`);
        });
    }
  }

  fetch('https://app-router.leancloud.cn/2/route?appId=' + '{{ theme.leancloud_visitors.app_id }}')
    .then(response => response.text())
    .then(api_server => {
      var Counter = (method, url, data) => {
        return $.ajax({
          method: method,
          url: `https://${api_server}/1.1${url}`,
          headers: {
            'X-LC-Id': '{{ theme.leancloud_visitors.app_id }}',
            'X-LC-Key': '{{ theme.leancloud_visitors.app_key }}',
            'Content-Type': 'application/json',
          },
          data: data
        });
      };
      if (CONFIG.page.isPost) {
        const localhost = /http:\/\/(localhost|127.0.0.1|0.0.0.0)/;
        if (localhost.test(document.URL)) return;
        addCount(Counter);
      } else {
        if (document.querySelectorAll('.post-title-link').length >= 1) {
          showTime(Counter);
        }
      }
    });
  </script>

{%- endif %}
