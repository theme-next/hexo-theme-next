/* global instantsearch, CONFIG */

window.addEventListener('DOMContentLoaded', () => {
  var algoliaSettings = CONFIG.algolia;
  var isAlgoliaSettingsValid = algoliaSettings.applicationID
                            && algoliaSettings.apiKey
                            && algoliaSettings.indexName;

  if (!isAlgoliaSettingsValid) {
    console.error('Algolia Settings are invalid.');
    return;
  }

  var search = instantsearch({
    appId         : algoliaSettings.applicationID,
    apiKey        : algoliaSettings.apiKey,
    indexName     : algoliaSettings.indexName,
    searchFunction: function(helper) {
      var searchInput = document.querySelector('#algolia-search-input input');

      if (searchInput.value {
        helper.search();
      }
    }
  });

  // Registering Widgets
  [
    instantsearch.widgets.searchBox({
      container  : '#algolia-search-input',
      placeholder: algoliaSettings.labels.input_placeholder
    }),

    instantsearch.widgets.hits({
      container  : '#algolia-hits',
      hitsPerPage: algoliaSettings.hits.per_page || 10,
      templates  : {
        item: function(data) {
          var link = data.permalink ? data.permalink : CONFIG.root + data.path;
          return `<a href="${link}" class="algolia-hit-item-link">${data._highlightResult.title.value}</a>`;
        },
        empty: function(data) {
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
        body: function(data) {
          var stats = algoliaSettings.labels.hits_stats
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
    $('body')
      .append('<div class="algolia-pop-overlay"></div>')
      .css('overflow', 'hidden');
    $('.popup').toggle();
    $('#algolia-search-input').find('input').focus();
  });

  function onPopupClose() {
    $('.popup').hide();
    $('.algolia-pop-overlay').remove();
    $('body').css('overflow', '');
  }
  $('.popup-btn-close').click(onPopupClose);

  window.addEventListener('keyup', event => {
    var shouldDismissSearchPopup = event.which === 27 && window.getComputedStyle(document.querySelector('.search-popup')).display !== 'none';
    if (shouldDismissSearchPopup) {
      onPopupClose();
    }
  });
});
