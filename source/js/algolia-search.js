/* global instantsearch, CONFIG */

window.addEventListener('DOMContentLoaded', () => {
  const algoliaSettings = CONFIG.algolia;
  let isAlgoliaSettingsValid = algoliaSettings.appID
    && algoliaSettings.apiKey
    && algoliaSettings.indexName;

  if (!isAlgoliaSettingsValid) {
    // eslint-disable-next-line no-console
    console.error('Algolia Settings are invalid.');
    return;
  }

  let search = instantsearch({
    appId         : algoliaSettings.appID,
    apiKey        : algoliaSettings.apiKey,
    indexName     : algoliaSettings.indexName,
    searchFunction: helper => {
      let searchInput = document.querySelector('#search-input input');

      if (searchInput.value) {
        helper.search();
      }
    }
  });

  // Registering Widgets
  [
    instantsearch.widgets.searchBox({
      container  : '#search-input',
      placeholder: algoliaSettings.labels.input_placeholder
    }),

    instantsearch.widgets.hits({
      container  : '#algolia-hits',
      hitsPerPage: algoliaSettings.hits.per_page || 10,
      templates  : {
        item: data => {
          let link = data.permalink ? data.permalink : CONFIG.root + data.path;
          return `<a href="${link}" class="algolia-hit-item-link">${data._highlightResult.title.value}</a>`;
        },
        empty: data => {
          return `<div id="algolia-hits-empty">
              ${algoliaSettings.labels.hits_empty.replace(/\$\{query}/, data.query)}
            </div>`;
        }
      },
      cssClasses: {
        item: 'algolia-hit-item'
      }
    }),

    instantsearch.widgets.stats({
      container: '#algolia-stats',
      templates: {
        body: data => {
          let stats = algoliaSettings.labels.hits_stats
            .replace(/\$\{hits}/, data.nbHits)
            .replace(/\$\{time}/, data.processingTimeMS);
          return `${stats}
            <span class="algolia-powered">
              <img src="${CONFIG.root}images/algolia_logo.svg" alt="Algolia"/>
            </span>
            <hr/>`;
        }
      }
    }),

    instantsearch.widgets.pagination({
      container    : '#algolia-pagination',
      scrollTo     : false,
      showFirstLast: false,
      labels       : {
        first   : '<i class="fa fa-angle-double-left"></i>',
        last    : '<i class="fa fa-angle-double-right"></i>',
        previous: '<i class="fa fa-angle-left"></i>',
        next    : '<i class="fa fa-angle-right"></i>'
      },
      cssClasses: {
        root    : 'pagination',
        item    : 'pagination-item',
        link    : 'page-number',
        active  : 'current',
        disabled: 'disabled-item'
      }
    })
  ].forEach(search.addWidget, search);

  search.start();

  document.querySelector('.popup-trigger').addEventListener('click', event => {
    event.stopPropagation();
    document.body.insertAdjacentHTML('beforeend', '<div class="search-pop-overlay"></div>');
    let el = document.querySelector('.popup');
    if (el.ownerDocument.defaultView.getComputedStyle(el, null).display === 'none') {
      el.style.display = 'block';
    } else {
      el.style.display = 'none';
    }
    document.querySelector('#search-input input').focus();
  });

  const onPopupClose = () => {
    document.querySelector('.popup').style.display = 'none';
    document.querySelector('.search-pop-overlay').remove();
    document.body.style.overflow = '';
  };
  document.querySelector('.popup-btn-close').addEventListener('click', onPopupClose);

  window.addEventListener('keyup', event => {
    let shouldDismissSearchPopup = event.which === 27 && window.getComputedStyle(document.querySelector('.popup')).display !== 'none';
    if (shouldDismissSearchPopup) {
      onPopupClose();
    }
  });
});
