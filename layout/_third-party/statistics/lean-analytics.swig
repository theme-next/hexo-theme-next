{%- if theme.leancloud_visitors.enable and not theme.valine.visitor %}
  <script{{ pjax }}>
  function leancloudSelector(url) {
    url = encodeURI(url);
    return document.getElementById(url).querySelector('.leancloud-visitors-count');
  }
  if (CONFIG.page.isPost) {
    function addCount(Counter) {
      var visitors = document.querySelector('.leancloud_visitors');
      var url = decodeURI(visitors.getAttribute('id'));
      var title = visitors.dataset.flagTitle;

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
                console.error('Failed to save visitor count', error);
              })
          } else {
            {%- if theme.leancloud_visitors.security %}
              leancloudSelector(url).innerText = 'Counter not initialized! More info at console err msg.';
              console.error('ATTENTION! LeanCloud counter has security bug, see how to solve it here: https://github.com/theme-next/hexo-leancloud-counter-security. \n However, you can still use LeanCloud without security, by setting `security` option to `false`.');
            {% else %}
              Counter('post', '/classes/Counter', { title, url, time: 1 })
                .then(response => response.json())
                .then(() => {
                  leancloudSelector(url).innerText = 1;
                })
                .catch(error => {
                  console.error('Failed to create', error);
                });
            {%- endif %}
          }
        })
        .catch(error => {
          console.error('LeanCloud Counter Error', error);
        });
    }
  } else {
    function showTime(Counter) {
      var visitors = document.querySelectorAll('.leancloud_visitors');
      var entries = [...visitors].map(element => {
        return decodeURI(element.getAttribute('id'));
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
          for (let item of results) {
            let { url, time } = item;
            leancloudSelector(url).innerText = time;
          }
          for (let url of entries) {
            var element = leancloudSelector(url);
            if (element.innerText == '') {
              element.innerText = 0;
            }
          }
        })
        .catch(error => {
          console.error('LeanCloud Counter Error', error);
        });
    }
  }

  fetch('https://app-router.leancloud.cn/2/route?appId={{ theme.leancloud_visitors.app_id }}')
    .then(response => response.json())
    .then(({ api_server }) => {
      var Counter = (method, url, data) => {
        return fetch(`https://${api_server}/1.1${url}`, {
          method,
          headers: {
            'X-LC-Id'     : '{{ theme.leancloud_visitors.app_id }}',
            'X-LC-Key'    : '{{ theme.leancloud_visitors.app_key }}',
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(data)
        });
      };
      if (CONFIG.page.isPost) {
        if (CONFIG.hostname !== location.hostname) return;
        addCount(Counter);
      } else if (document.querySelectorAll('.post-title-link').length >= 1) {
        showTime(Counter);
      }
    });
  </script>

{%- endif %}
