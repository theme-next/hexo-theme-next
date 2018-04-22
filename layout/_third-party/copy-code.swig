{% if theme.codeblock.copy_button %}
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
      $('.highlight').each(function(i, e) {
          var $wrap = $('<div>').addClass('highlight-wrap')
          $(e).after($wrap)
          $wrap.append($('<button>').addClass('copy-btn').append('{{__("post.copy_button")}}').on('click', function(e) {
              var code = $(e.target).parent().find('.code').find('.line').map(function(i, e) {
                  return $(e).text()
              }).toArray().join('\n')
              var ta = document.createElement('textarea')
              document.body.appendChild(ta)
              ta.style.position = 'fixed'
              ta.style.top = 0
              ta.style.left = 0
              ta.value = code
              ta.select()
              ta.focus()
              document.execCommand('copy')
              document.body.removeChild(ta)
          })).append(e)
      })
  </script>
{% endif %}
