{%- if theme.leancloud_visitors.enable and not theme.valine.visitor %}
  {# custom analytics part create by xiamo; edited by LEAFERx #}
  <script{{ pjax }}>
  function leancloudSelector(url) {
    return document.getElementById(url).querySelector('.leancloud-visitors-count');
  }
  if (CONFIG.page.isPost) {
    function addCount(Counter) {
      var visitors = document.querySelector('.leancloud_visitors');
      var url = visitors.getAttribute('id').trim();
      var title = visitors.getAttribute('data-flag-title').trim();

      Counter('get', `/classes/Counter?where=${JSON.stringify({ url })}`)
        .then(response => response.json())
        .then(({ results }) => {
          if (results.length > 0) {
            var counter = results[0];
            {%- if theme.leancloud_visitors.betterPerformance %}
              leancloudSelector(url).innerText = counter.time + 1;
            {%- endif %}
            Counter('put', '/classes/Counter/' + counter.objectId, { time: { '__op': 'Increment', 'amount': 1 } })
              .then(response => response.json())
            {%- if not theme.leancloud_visitors.betterPerformance %}
              .then(() => {
                leancloudSelector(url).innerText = counter.time + 1;
              })
            {%- endif %}
              .catch(error => {
                console.log('Failed to save visitor count', error);
              })
          } else {
            {%- if theme.leancloud_visitors.security %}
              leancloudSelector(url).innerText = 'Counter not initialized! More info at console err msg.';
              console.error('ATTENTION! LeanCloud counter has security bug, see how to solve it here: https://github.com/theme-next/hexo-leancloud-counter-security. \n However, you can still use LeanCloud without security, by setting `security` option to `false`.');
            {% else %}
              Counter('post', '/classes/Counter', { title: title, url: url, time: 1 })
                .then(response => response.json())
                .then(() => {
                  leancloudSelector(url).innerText = 1;
                })
                .catch(error => {
                  console.log('Failed to create', error);
                });
            {%- endif %}
          }
        })
        .catch(error => {
          console.log('LeanCloud Counter Error', error);
        });
    }
  } else {
    function showTime(Counter) {
      var visitors = document.querySelectorAll('.leancloud_visitors');
      var entries = [...visitors].map(element => {
        return element.getAttribute('id').trim();
      });

      Counter('get', `/classes/Counter?where=${JSON.stringify({ url: { '$in': entries } })}`)
        .then(response => response.json())
        .then(({ results }) => {
          if (results.length === 0) {
            document.querySelectorAll('.leancloud_visitors .leancloud-visitors-count').forEach(element => {
              element.innerText = 0;
            });
            return;
          }
          for (var i = 0; i < results.length; i++) {
            var item = results[i];
            var url = item.url;
            var time = item.time;
            leancloudSelector(url).innerText = time;
          }
          for (var i = 0; i < entries.length; i++) {
            var url = entries[i];
            var element = leancloudSelector(url);
            if (element.innerText == '') {
              element.innerText = 0;
            }
          }
        })
        .catch(error => {
          console.log('LeanCloud Counter Error', error);
        });
    }
  }

  fetch('https://app-router.leancloud.cn/2/route?appId={{ theme.leancloud_visitors.app_id }}')
    .then(response => response.json())
    .then(({ api_server }) => {
      var Counter = (method, url, data) => {
        return fetch(`https://${api_server}/1.1${url}`, {
          method: method,
          headers: {
            'X-LC-Id': '{{ theme.leancloud_visitors.app_id }}',
            'X-LC-Key': '{{ theme.leancloud_visitors.app_key }}',
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(data)
        });
      };
      if (CONFIG.page.isPost) {
        const localhost = /http:\/\/(localhost|127.0.0.1|0.0.0.0)/;
        if (localhost.test(document.URL)) return;
        addCount(Counter);
      } else if (document.querySelectorAll('.post-title-link').length >= 1) {
        showTime(Counter);
      }
    });
  </script>

{%- endif %}
