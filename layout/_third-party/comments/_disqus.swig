{% if theme.disqus.enable %}
  {% if theme.disqus.count  %}
    <script id="dsq-count-scr" src="https://{{theme.disqus.shortname}}.disqus.com/count.js" async></script>
  {% endif %}

  {% if page.comments %}
    <script type="text/javascript">
      function checkDisqus(){
        // var dsp = $.trim($("#dsq-app1").attr("id"));
        var dsp = $.trim($('iframe[id^=dsq-app]').attr("id"));
        if(dsp == ""){
          $("#disqus_thread").append('<div style="text-align: center;" id="reload_div">Loaded Disqus Failured. Please Ensure You Can Access [disqus.com] ! Then <a href="javascript:void(0);" onclick="showDisqus();">Reload</a>!</div>');
        }
      }

      function showDisqus(){
        $("#reload_div").remove();
        $("#disqus_title").attr("style","display:none");
        $("#dqs_loading").addClass("dqs_loading");
        $("#dqs_loading_inner").addClass("dqs_loading_inner");
        $("#disqus_thread").addClass("disqus_thread");
        setTimeout("checkDisqus()",20000);

        var disqus_config = function () {
          this.page.url = '{{ page.permalink }}';
          this.page.identifier = '{{ page.path }}';
          this.page.title = '{{ page.title| addslashes }}';
        };
        var d = document, s = d.createElement('script');
        s.src = 'https://{{theme.disqus.shortname}}.disqus.com/embed.js';
        s.setAttribute('data-timestamp', '' + new Date());
        (d.head || d.body).appendChild(s);

        window.location.hash="#disqus_thread";
      }

      {% if !theme.disqus.click_show %}
        showDisqus();
      {% endif %}
    </script>
  {% endif %}
{% endif %}
