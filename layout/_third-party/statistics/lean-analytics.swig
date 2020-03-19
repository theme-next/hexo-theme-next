{%- if theme.leancloud_visitors.enable and not theme.valine.visitor %}
<script{{ pjax }}>
  (function() {
    function leancloudSelector(url) {
      url = encodeURI(url);
      return document.getElementById(url).querySelector('.leancloud-visitors-count');
    }

    function addCount(Counter) {
      var visitors = document.querySelector('.leancloud_visitors');
      var url = decodeURI(visitors.id);
      var title = visitors.dataset.flagTitle;

      Counter('get', '/classes/Counter?where=' + encodeURIComponent(JSON.stringify({ url })))
        .then(response => response.json())
        .then(({ results }) => {
          if (results.length > 0) {
            var counter = results[0];
            leancloudSelector(url).innerText = counter.time + 1;
            Counter('put', '/classes/Counter/' + counter.objectId, { time: { '__op': 'Increment', 'amount': 1 } })
              .catch(error => {
                console.error('Failed to save visitor count', error);
              });
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

    function showTime(Counter) {
      var visitors = document.querySelectorAll('.leancloud_visitors');
      var entries = [...visitors].map(element => {
        return decodeURI(element.id);
      });

      Counter('get', '/classes/Counter?where=' + encodeURIComponent(JSON.stringify({ url: { '$in': entries } })))
        .then(response => response.json())
        .then(({ results }) => {
          for (let url of entries) {
            let target = results.find(item => item.url === url);
            leancloudSelector(url).innerText = target ? target.time : 0;
          }
        })
        .catch(error => {
          console.error('LeanCloud Counter Error', error);
        });
    }

    let { app_id, app_key, server_url } = {{ theme.leancloud_visitors | json }};
    function fetchData(api_server) {
      var Counter = (method, url, data) => {
        return fetch(`${api_server}/1.1${url}`, {
          method,
          headers: {
            'X-LC-Id'     : app_id,
            'X-LC-Key'    : app_key,
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
    }

    let api_server = app_id.slice(-9) !== '-MdYXbMMI' ? server_url : `https://${app_id.slice(0, 8).toLowerCase()}.api.lncldglobal.com`;

    if (api_server) {
      fetchData(api_server);
    } else {
      fetch('https://app-router.leancloud.cn/2/route?appId=' + app_id)
        .then(response => response.json())
        .then(({ api_server }) => {
          fetchData('https://' + api_server);
        });
    }
  })();
</script>

{%- endif %}
