{%- if theme.firestore.enable %}
  <script src="https://www.gstatic.com/firebasejs/6.3.3/firebase-app.js"></script>
  <script src="https://www.gstatic.com/firebasejs/6.3.3/firebase-firestore.js"></script>
  <script>
    firebase.initializeApp({
      apiKey: '{{ theme.firestore.apiKey }}',
      projectId: '{{ theme.firestore.projectId }}'
    });

    function getCount(doc, increaseCount) {
      // IncreaseCount will be false when not in article page

      return doc.get().then(d => {
        var count;
        if (!d.exists) { // Has no data, initialize count
          if (increaseCount) {
            doc.set({
              count: 1
            });
            count = 1;
          } else {
            count = 0;
          }
        } else { // Has data
          count = d.data().count;
          if (increaseCount) {
            if (!(window.localStorage && window.localStorage.getItem(title))) { // If first view this article
              doc.set({ // Increase count
                count: count + 1
              });
              count++;
            }
          }
        }
        if (window.localStorage && increaseCount) { // Mark as visited
          localStorage.setItem(title, true);
        }

        return count;
      });
    }

    function appendCountTo(el) {
      return function(count) {
        $(el).text(count);
      }
    }

    var db = firebase.firestore();
    var articles = db.collection('{{ theme.firestore.collection }}');
  </script>
  <script{{ pjax }}>
    if (CONFIG.page.isPost) { // Is article page
      var title = $('.post-title').text().trim();
      var doc = articles.doc(title);

      getCount(doc, true).then(appendCountTo($('.firestore-visitors-count')));
    } else if (CONFIG.page.isHome) { // Is index page
      var promises = $('.post-title').map((i, o) => {
        var title = $(o).text().trim();
        var doc = articles.doc(title);
        return getCount(doc);
      });
      Promise.all(promises).then(counts => {
        var metas = $('.firestore-visitors-count');
        counts.forEach((val, idx) => {
          appendCountTo(metas[idx])(val);
        });
      });
    }
  </script>
{%- endif %}
