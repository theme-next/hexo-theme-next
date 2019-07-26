/* global CONFIG */

'use strict';

$(document).ready(function() {
  // Popup Window
  var isfetched = false;
  var datas;
  var isXml = true;
  // Search DB path
  var searchPath = CONFIG.search.path;
  if (searchPath.length === 0) {
    searchPath = 'search.xml';
  } else if (/json$/i.test(searchPath)) {
    isXml = false;
  }
  var path = CONFIG.search.root + searchPath;
  var input = document.getElementById('local-search-input');
  var resultContent = document.getElementById('local-search-result');

  // Ref: https://github.com/ForbesLindesay/unescape-html
  function unescapeHtml(html) {
    return String(html)
      .replace(/&quot;/g, '"')
      .replace(/&#39;/g, '\'')
      .replace(/&#x3A;/g, ':')
      // Replace all the other &#x; chars
      .replace(/&#(\d+);/g, function(m, p) {
        return String.fromCharCode(p);
      })
      .replace(/&lt;/g, '<')
      .replace(/&gt;/g, '>')
      .replace(/&amp;/g, '&');
  }
  function getIndexByWord(word, text, caseSensitive) {
    var wordLen = word.length;
    if (wordLen === 0) {
      return [];
    }
    var startPosition = 0, position = [], index = [];
    if (!caseSensitive) {
      text = text.toLowerCase();
      word = word.toLowerCase();
    }
    while ((position = text.indexOf(word, startPosition)) > -1) {
      index.push({
        position: position,
        word: word
      });
      startPosition = position + wordLen;
    }
    return index;
  }

  // Merge hits into slices
  function mergeIntoSlice(text, start, end, index, searchText) {
    var item = index[index.length - 1];
    var position = item.position;
    var word = item.word;
    var hits = [];
    var searchTextCountInSlice = 0;
    while (position + word.length <= end && index.length !== 0) {
      if (word === searchText) {
        searchTextCountInSlice++;
      }
      hits.push({
        position: position,
        length: word.length
      });
      var wordEnd = position + word.length;

      // Move to next position of hit
      index.pop();
      while (index.length !== 0) {
        item = index[index.length - 1];
        position = item.position;
        word = item.word;
        if (wordEnd > position) {
          index.pop();
        } else {
          break;
        }
      }
    }
    return {
      hits: hits,
      start: start,
      end: end,
      searchTextCount: searchTextCountInSlice
    };
  }

  // Highlight title and content
  function highlightKeyword(text, slice) {
    var result = '';
    var prevEnd = slice.start;
    slice.hits.forEach(function(hit) {
      result += text.substring(prevEnd, hit.position);
      var end = hit.position + hit.length;
      result += '<b class="search-keyword">' + text.substring(hit.position, end) + '</b>';
      prevEnd = end;
    });
    result += text.substring(prevEnd, slice.end);
    return result;
  }
  function inputEventFunction() {
    var searchText = input.value.trim().toLowerCase();
    var keywords = searchText.split(/[-\s]+/);
    if (keywords.length > 1) {
      keywords.push(searchText);
    }
    var resultItems = [];
    if (searchText.length > 0) {
      // Perform local searching
      datas.forEach(function(data) {
        // Only match articles with not empty titles
        if (!data.title) {
          return;
        }
        var searchTextCount = 0;
        var title = data.title.trim();
        var titleInLowerCase = title.toLowerCase();
        var content = data.content ? data.content.trim().replace(/<[^>]+>/g, '') : '';
        if (CONFIG.localsearch.unescape) {
          content = unescapeHtml(content);
        }
        var contentInLowerCase = content.toLowerCase();
        var articleUrl = decodeURIComponent(data.url).replace(/\/{2,}/g, '/');
        var indexOfTitle = [];
        var indexOfContent = [];
        keywords.forEach(function(keyword) {
          indexOfTitle = indexOfTitle.concat(getIndexByWord(keyword, titleInLowerCase, false));
          indexOfContent = indexOfContent.concat(getIndexByWord(keyword, contentInLowerCase, false));
        });

        // Show search results
        if (indexOfTitle.length > 0 || indexOfContent.length > 0) {
          var hitCount = indexOfTitle.length + indexOfContent.length;
          // Sort index by position of keyword
          [indexOfTitle, indexOfContent].forEach(function(index) {
            index.sort(function(itemLeft, itemRight) {
              if (itemRight.position !== itemLeft.position) {
                return itemRight.position - itemLeft.position;
              } else {
                return itemLeft.word.length - itemRight.word.length;
              }
            });
          });

          var slicesOfTitle = [];
          if (indexOfTitle.length !== 0) {
            var tmp = mergeIntoSlice(title, 0, title.length, indexOfTitle, searchText);
            searchTextCount += tmp.searchTextCountInSlice;
            slicesOfTitle.push(tmp);
          }

          var slicesOfContent = [];
          while (indexOfContent.length !== 0) {
            var item = indexOfContent[indexOfContent.length - 1];
            var position = item.position;
            var word = item.word;
            // Cut out 100 characters
            var start = position - 20;
            var end = position + 80;
            if (start < 0) {
              start = 0;
            }
            if (end < position + word.length) {
              end = position + word.length;
            }
            if (end > content.length) {
              end = content.length;
            }
            var tmp = mergeIntoSlice(content, start, end, indexOfContent, searchText);
            searchTextCount += tmp.searchTextCountInSlice;
            slicesOfContent.push(tmp);
          }

          // Sort slices in content by search text's count and hits' count
          slicesOfContent.sort(function(sliceLeft, sliceRight) {
            if (sliceLeft.searchTextCount !== sliceRight.searchTextCount) {
              return sliceRight.searchTextCount - sliceLeft.searchTextCount;
            } else if (sliceLeft.hits.length !== sliceRight.hits.length) {
              return sliceRight.hits.length - sliceLeft.hits.length;
            } else {
              return sliceLeft.start - sliceRight.start;
            }
          });

          // Select top N slices in content
          var upperBound = parseInt(CONFIG.localsearch.top_n_per_article, 10);
          if (upperBound >= 0) {
            slicesOfContent = slicesOfContent.slice(0, upperBound);
          }

          var resultItem = '';

          if (slicesOfTitle.length !== 0) {
            resultItem += '<li><a href="' + articleUrl + '" class="search-result-title">' + highlightKeyword(title, slicesOfTitle[0]) + '</a>';
          } else {
            resultItem += '<li><a href="' + articleUrl + '" class="search-result-title">' + title + '</a>';
          }

          slicesOfContent.forEach(function(slice) {
            resultItem += '<a href="' + articleUrl + '">'
              + '<p class="search-result">' + highlightKeyword(content, slice)
              + '...</p></a>';
          });

          resultItem += '</li>';
          resultItems.push({
            item: resultItem,
            searchTextCount: searchTextCount,
            hitCount: hitCount,
            id: resultItems.length
          });
        }
      });
    }
    if (keywords.length === 1 && keywords[0] === '') {
      resultContent.innerHTML = '<div id="no-result"><i class="fa fa-search fa-5x"></i></div>';
    } else if (resultItems.length === 0) {
      resultContent.innerHTML = '<div id="no-result"><i class="fa fa-frown-o fa-5x"></i></div>';
    } else {
      resultItems.sort(function(resultLeft, resultRight) {
        if (resultLeft.searchTextCount !== resultRight.searchTextCount) {
          return resultRight.searchTextCount - resultLeft.searchTextCount;
        } else if (resultLeft.hitCount !== resultRight.hitCount) {
          return resultRight.hitCount - resultLeft.hitCount;
        } else {
          return resultRight.id - resultLeft.id;
        }
      });
      var searchResultList = '<ul class="search-result-list">';
      resultItems.forEach(function(result) {
        searchResultList += result.item;
      });
      searchResultList += '</ul>';
      resultContent.innerHTML = searchResultList;
    }
  }
  function fetchData(callback) {
    $.ajax({
      url: path,
      dataType: isXml ? 'xml' : 'json',
      success: function(res) {
        // Get the contents from search data
        isfetched = true;
        datas = isXml ? $('entry', res).map(function() {
          return {
            title: $('title', this).text(),
            content: $('content', this).text(),
            url: $('url', this).text()
          };
        }).get() : res;

        // Remove loading animation
        $('.local-search-pop-overlay').remove();
        $('body').css('overflow', '');

        if (callback) {
          callback();
        }
      }
    });
  }
  if (CONFIG.localsearch.preload) {
    fetchData();
  }

  // Monitor main search box
  function onPopupClose() {
    $('.popup').hide();
    $('#local-search-input').val('');
    $('.search-result-list').remove();
    $('#no-result').remove();
    $('.local-search-pop-overlay').remove();
    $('body').css('overflow', '');
  }

  function proceedSearch() {
    $('body')
      .append('<div class="search-popup-overlay local-search-pop-overlay"></div>')
      .css('overflow', 'hidden');
    $('.search-popup-overlay').click(onPopupClose);
    $('.popup').toggle();
    var $localSearchInput = $('#local-search-input');
    $localSearchInput.attr('autocapitalize', 'none');
    $localSearchInput.attr('autocorrect', 'off');
    $localSearchInput.focus();
  }

  // Search function
  function searchFunc() {
    // Start loading animation
    $('body')
      .append('<div class="search-popup-overlay local-search-pop-overlay">'
        + '<div id="search-loading-icon">'
        + '<i class="fa fa-spinner fa-pulse fa-5x fa-fw"></i>'
        + '</div>'
        + '</div>')
      .css('overflow', 'hidden');
    $('#search-loading-icon').css({
      margin: '20% auto 0 auto',
      'text-align': 'center'
    });
    fetchData(proceedSearch);
  }

  if (CONFIG.localsearch.trigger === 'auto') {
    input.addEventListener('input', inputEventFunction);
  } else {
    $('.search-icon').click(inputEventFunction);
    input.addEventListener('keypress', function(event) {
      if (event.keyCode === 13) {
        inputEventFunction();
      }
    });
  }

  // Handle and trigger popup window
  $('.popup-trigger').click(function(e) {
    e.stopPropagation();
    if (isfetched === false) {
      searchFunc();
    } else {
      proceedSearch();
    }
  });

  $('.popup-btn-close').click(onPopupClose);
  $('.popup').click(function(e) {
    e.stopPropagation();
  });
  $(document).on('keyup', function(event) {
    var shouldDismissSearchPopup = event.which === 27 && $('.search-popup').is(':visible');
    if (shouldDismissSearchPopup) {
      onPopupClose();
    }
  });
});
