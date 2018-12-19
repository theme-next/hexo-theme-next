{% if theme.codeblock.copy_button.enable %}
  <style>
    .copy-btn {
      display: inline-block;
      padding: 6px 12px;
      font-size: 13px;
      font-weight: 700;
      line-height: 20px;
      color: #333;
      white-space: nowrap;
      vertical-align: middle;
      cursor: pointer;
      background-color: #eee;
      background-image: linear-gradient(#fcfcfc, #eee);
      border: 1px solid #d5d5d5;
      border-radius: 3px;
      user-select: none;
      outline: 0;
    }

    .highlight-wrap .copy-btn {
      transition: opacity .3s ease-in-out;
      opacity: 0;
      padding: 2px 6px;
      position: absolute;
      right: 4px;
      top: 8px;
    }

    .highlight-wrap:hover .copy-btn,
    .highlight-wrap .copy-btn:focus {
      opacity: 1
    }

    .highlight-wrap {
      position: relative;
    }
  </style>
  <script>
    $('.highlight').each(function (i, e) {
      var $wrap = $('<div>').addClass('highlight-wrap');
      $(e).after($wrap);
      $wrap.append($('<button>').addClass('copy-btn').append('{{__("post.copy_button")}}').on('click', function (e) {
        var code = $(this).parent().find('.code').find('.line').map(function (i, e) {
          return $(e).text();
        }).toArray().join('\n');
        var ta = document.createElement('textarea');
        var range = document.createRange(); //For Chrome
        var sel = window.getSelection(); //For Chrome
        var yPosition = window.pageYOffset || document.documentElement.scrollTop;
        ta.style.top = yPosition + 'px'; //Prevent page scroll
        ta.style.position = 'absolute';
        ta.style.opacity = '0';
        ta.value = code;
        ta.textContent = code; //For FireFox
        ta.contentEditable = true;
        ta.readOnly = false;
        document.body.appendChild(ta);
        range.selectNode(ta);
        sel.removeAllRanges();
        sel.addRange(range);
        ta.setSelectionRange(0, code.length);
        var result = document.execCommand('copy');
        {% if theme.codeblock.copy_button.show_result %}
          if (result) $(this).text('{{__("post.copy_success")}}');
          else $(this).text('{{__("post.copy_failure")}}');
        {% endif %}
        ta.blur(); //For iOS
        $(this).blur();
      })).on('mouseleave', function (e) {
        var $b = $(this).find('.copy-btn');
        setTimeout(function () {
          $b.text('{{__("post.copy_button")}}');
        }, 300);
      }).append(e);
    })
  </script>
{% endif %}
