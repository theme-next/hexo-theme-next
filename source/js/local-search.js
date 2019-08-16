/* global CONFIG */

window.addEventListener('DOMContentLoaded', () => {
  // Popup Window
  let isfetched = false;
  let datas;
  let isXml = true;
  // Search DB path
  let searchPath = CONFIG.path;
  if (searchPath.length === 0) {
    searchPath = 'search.xml';
  } else if (/json$/i.test(searchPath)) {
    isXml = false;
  }
  const path = CONFIG.root + searchPath;
  const input = document.getElementById('search-input');
  const resultContent = document.getElementById('search-result');

  const removeElement = element => {
    let el = document.querySelector(element);
    if (el) el.remove();
  };
  // Ref: https://github.com/ForbesLindesay/unescape-html
  const unescapeHtml = html => {
    return String(html)
      .replace(/&quot;/g, '"')
      .replace(/&#39;/g, '\'')
      .replace(/&#x3A;/g, ':')
      // Replace all the other &#x; chars
      .replace(/&#(\d+);/g, (m, p) => {
        return String.fromCharCode(p);
      })
      .replace(/&lt;/g, '<')
      .replace(/&gt;/g, '>')
      .replace(/&amp;/g, '&');
  };

  const getIndexByWord = (word, text, caseSensitive) => {
    let wordLen = word.length;
    if (wordLen === 0) {
      return [];
    }
    let startPosition = 0;
    let position = [];
    let index = [];
    if (!caseSensitive) {
      text = text.toLowerCase();
      word = word.toLowerCase();
    }
    while ((position = text.indexOf(word, startPosition)) > -1) {
      index.push({
        position: position,
        word    : word
      });
      startPosition = position + wordLen;
    }
    return index;
  };

  // Merge hits into slices
  const mergeIntoSlice = (text, start, end, index, searchText) => {
    let item = index[index.length - 1];
    let position = item.position;
    let word = item.word;
    let hits = [];
    let searchTextCountInSlice = 0;
    while (position + word.length <= end && index.length !== 0) {
      if (word === searchText) {
        searchTextCountInSlice++;
      }
      hits.push({
        position: position,
        length  : word.length
      });
      let wordEnd = position + word.length;

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
      hits           : hits,
      start          : start,
      end            : end,
      searchTextCount: searchTextCountInSlice
    };
  };

  // Highlight title and content
  const highlightKeyword = (text, slice) => {
    let result = '';
    let prevEnd = slice.start;
    slice.hits.forEach(hit => {
      result += text.substring(prevEnd, hit.position);
      let end = hit.position + hit.length;
      result += `<b class="search-keyword">${text.substring(hit.position, end)}</b>`;
      prevEnd = end;
    });
    result += text.substring(prevEnd, slice.end);
    return result;
  };

  const inputEventFunction = () => {
    let searchText = input.value.trim().toLowerCase();
    let keywords = searchText.split(/[-\s]+/);
    if (keywords.length > 1) {
      keywords.push(searchText);
    }
    let resultItems = [];
    if (searchText.length > 0) {
      // Perform local searching
      datas.forEach(data => {
        // Only match articles with not empty titles
        if (!data.title) {
          return;
        }
        let searchTextCount = 0;
        let title = data.title.trim();
        let titleInLowerCase = title.toLowerCase();
        let content = data.content ? data.content.trim().replace(/<[^>]+>/g, '') : '';
        if (CONFIG.localsearch.unescape) {
          content = unescapeHtml(content);
        }
        let contentInLowerCase = content.toLowerCase();
        let articleUrl = decodeURIComponent(data.url).replace(/\/{2,}/g, '/');
        let indexOfTitle = [];
        let indexOfContent = [];
        keywords.forEach(keyword => {
          indexOfTitle = indexOfTitle.concat(getIndexByWord(keyword, titleInLowerCase, false));
          indexOfContent = indexOfContent.concat(getIndexByWord(keyword, contentInLowerCase, false));
        });

        // Show search results
        if (indexOfTitle.length > 0 || indexOfContent.length > 0) {
          let hitCount = indexOfTitle.length + indexOfContent.length;
          // Sort index by position of keyword
          [indexOfTitle, indexOfContent].forEach(index => {
            index.sort((itemLeft, itemRight) => {
              if (itemRight.position !== itemLeft.position) {
                return itemRight.position - itemLeft.position;
              }
              return itemLeft.word.length - itemRight.word.length;
            });
          });

          let slicesOfTitle = [];
          if (indexOfTitle.length !== 0) {
            let tmp = mergeIntoSlice(title, 0, title.length, indexOfTitle, searchText);
            searchTextCount += tmp.searchTextCountInSlice;
            slicesOfTitle.push(tmp);
          }

          let slicesOfContent = [];
          while (indexOfContent.length !== 0) {
            let item = indexOfContent[indexOfContent.length - 1];
            let position = item.position;
            let word = item.word;
            // Cut out 100 characters
            let start = position - 20;
            let end = position + 80;
            if (start < 0) {
              start = 0;
            }
            if (end < position + word.length) {
              end = position + word.length;
            }
            if (end > content.length) {
              end = content.length;
            }
            let tmp = mergeIntoSlice(content, start, end, indexOfContent, searchText);
            searchTextCount += tmp.searchTextCountInSlice;
            slicesOfContent.push(tmp);
          }

          // Sort slices in content by search text's count and hits' count
          slicesOfContent.sort((sliceLeft, sliceRight) => {
            if (sliceLeft.searchTextCount !== sliceRight.searchTextCount) {
              return sliceRight.searchTextCount - sliceLeft.searchTextCount;
            } else if (sliceLeft.hits.length !== sliceRight.hits.length) {
              return sliceRight.hits.length - sliceLeft.hits.length;
            }
            return sliceLeft.start - sliceRight.start;
          });

          // Select top N slices in content
          let upperBound = parseInt(CONFIG.localsearch.top_n_per_article, 10);
          if (upperBound >= 0) {
            slicesOfContent = slicesOfContent.slice(0, upperBound);
          }

          let resultItem = '';

          if (slicesOfTitle.length !== 0) {
            resultItem += `<li><a href="${articleUrl}" class="search-result-title">${highlightKeyword(title, slicesOfTitle[0])}</a>`;
          } else {
            resultItem += `<li><a href="${articleUrl}" class="search-result-title">${title}</a>`;
          }

          slicesOfContent.forEach(slice => {
            resultItem += `<a href="${articleUrl}"><p class="search-result">${highlightKeyword(content, slice)}...</p></a>`;
          });

          resultItem += '</li>';
          resultItems.push({
            item           : resultItem,
            searchTextCount: searchTextCount,
            hitCount       : hitCount,
            id             : resultItems.length
          });
        }
      });
    }
    if (keywords.length === 1 && keywords[0] === '') {
      resultContent.innerHTML = '<div id="no-result"><i class="fa fa-search fa-5x"></i></div>';
    } else if (resultItems.length === 0) {
      resultContent.innerHTML = '<div id="no-result"><i class="fa fa-frown-o fa-5x"></i></div>';
    } else {
      resultItems.sort((resultLeft, resultRight) => {
        if (resultLeft.searchTextCount !== resultRight.searchTextCount) {
          return resultRight.searchTextCount - resultLeft.searchTextCount;
        } else if (resultLeft.hitCount !== resultRight.hitCount) {
          return resultRight.hitCount - resultLeft.hitCount;
        }
        return resultRight.id - resultLeft.id;
      });
      let searchResultList = '<ul class="search-result-list">';
      resultItems.forEach(result => {
        searchResultList += result.item;
      });
      searchResultList += '</ul>';
      resultContent.innerHTML = searchResultList;
    }
  };

  const fetchData = callback => {
    fetch(path)
      .then(response => response.text())
      .then(res => {
        // Get the contents from search data
        isfetched = true;
        datas = isXml ? $('entry', res).map((i, e) => {
          return {
            title  : $('title', e).text(),
            content: $('content', e).text(),
            url    : $('url', e).text()
          };
        }).get() : JSON.parse(res);

        // Remove loading animation
        removeElement('.search-pop-overlay');
        document.body.style.overflow = '';

        if (callback) {
          callback();
        }
      });
  };

  if (CONFIG.localsearch.preload) {
    fetchData();
  }

  // Monitor main search box
  const onPopupClose = () => {
    document.querySelector('.popup').style.display = 'none';
    document.querySelector('#search-input').value = '';
    removeElement('.search-result-list');
    removeElement('#no-result');
    removeElement('.search-pop-overlay');
    document.body.style.overflow = '';
  };

  const proceedSearch = () => {
    document.body.insertAdjacentHTML('beforeend', '<div class="search-pop-overlay"></div>');
    document.body.style.overflow = 'hidden';
    document.querySelector('.search-pop-overlay').addEventListener('click', onPopupClose);
    let el = document.querySelector('.popup');
    if (el.isVisible()) {
      el.style.display = 'none';
    } else {
      el.style.display = 'block';
    }
    document.getElementById('search-input').focus();
  };

  // Search function
  const searchFunc = () => {
    document.body.insertAdjacentHTML('beforeend', '<div class="search-pop-overlay"><div id="search-loading-icon"><i class="fa fa-spinner fa-pulse fa-5x fa-fw"></i></div></div>');
    document.querySelector('#search-loading-icon').css({
      margin      : '20% auto 0 auto',
      'text-align': 'center'
    });
    fetchData(proceedSearch);
  };

  if (CONFIG.localsearch.trigger === 'auto') {
    input.addEventListener('input', inputEventFunction);
  } else {
    document.querySelector('.search-icon').addEventListener('click', inputEventFunction);
    input.addEventListener('keypress', event => {
      if (event.keyCode === 13) {
        inputEventFunction();
      }
    });
  }

  // Handle and trigger popup window
  document.querySelector('.popup-trigger').addEventListener('click', event => {
    event.stopPropagation();
    if (isfetched === false) {
      searchFunc();
    } else {
      proceedSearch();
    }
  });

  document.querySelector('.popup-btn-close').addEventListener('click', onPopupClose);
  document.querySelector('.popup').addEventListener('click', event => {
    event.stopPropagation();
  });
  window.addEventListener('keyup', event => {
    let shouldDismissSearchPopup = event.which === 27 && document.querySelector('.popup').isVisible();
    if (shouldDismissSearchPopup) {
      onPopupClose();
    }
  });
});
