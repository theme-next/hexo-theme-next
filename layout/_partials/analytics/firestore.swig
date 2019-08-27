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
        var count = 0;
        if (!d.exists) { // Has no data, initialize count
          if (increaseCount) {
            doc.set({
              count: 1
            });
            count = 1;
          }
        } else { // Has data
          count = d.data().count;
          if (increaseCount) {
            // If first view this article
            doc.set({ // Increase count
              count: count + 1
            });
            count++;
          }
        }

        return count;
      });
    }

    function appendCountTo(el) {
      return count => {
        el.innerText = count;
      }
    }
  </script>
  <script{{ pjax }}>
    (function() {
      var db = firebase.firestore();
      var articles = db.collection('{{ theme.firestore.collection }}');

      if (CONFIG.page.isPost) { // Is article page
        var title = document.querySelector('.post-title').innerText.trim();
        var doc = articles.doc(title);
        var increaseCount = true;
        if (localStorage.getItem(title)) {
          increaseCount = false;
        } else {
          // Mark as visited
          localStorage.setItem(title, true);
        }
        getCount(doc, increaseCount).then(appendCountTo(document.querySelector('.firestore-visitors-count')));
      } else if (CONFIG.page.isHome) { // Is index page
        var promises = [...document.querySelectorAll('.post-title')].map(element => {
          var title = element.innerText.trim();
          var doc = articles.doc(title);
          return getCount(doc);
        });
        Promise.all(promises).then(counts => {
          var metas = document.querySelectorAll('.firestore-visitors-count');
          counts.forEach((val, idx) => {
            appendCountTo(metas[idx])(val);
          });
        });
      }
    })();
  </script>
{%- endif %}
