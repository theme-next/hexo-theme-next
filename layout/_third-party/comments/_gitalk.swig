{% if theme.gitalk.enable and not is_home() %}
  <!--
  <link rel="stylesheet" href="https://unpkg.com/gitalk/dist/gitalk.css">
  <script src="https://unpkg.com/gitalk/dist/gitalk.min.js"></script>
  -->
  <link rel="stylesheet" href="/css/gitalk.css">
  <script src="/js/src/gitalk.min.js"></script>
  <style type="text/css">
    /* 淡黄色背景设置 ----begin------
    .gt-container .gt-comment-content {
        background-color: #f5f5d5;
        border-bottom: 1px dashed #d3d3d3;
    }

    .gt-container .gt-comment-admin .gt-comment-content {
        background-color: #f5f5d5;
    }

    .gt-container .gt-header-textarea {
        background-color: #F1F1E5;
    }

    .gt-container .gt-popup {
        background: #f5f5d5;
        border: 1px solid #d7d7ce;
    }

    .gt-container .gt-btn {
        background-color: rgba(97, 144, 232, 0);
        border: 1px solid #349caf;
        color: #2e9faf;
        border-radius: 4px;
    }

    .gt-container .gt-btn:hover {
        background-color: #1da2b3;
    }

    .gt-container .gt-comment-content:hover {
      -webkit-box-shadow: 0 0.625em 3.75em 0 #d7d7ce;
              box-shadow: 0 0.625em 3.75em 0 #d7d7ce;
    }
    淡黄色背景设置 ----end------ */
  </style>
  <script>
    function showGitalk(){
        $("#gitalk_title").attr("style","display:none");
        $("#gitalk_container").attr("style","").addClass("gitalk_container");

        var gitalk = new Gitalk({
            id: window.location.pathname,
            clientID: '{{ theme.gitalk.client_id }}',
            clientSecret: '{{ theme.gitalk.client_secret }}',
            repo: '{{ theme.gitalk.repo }}',
            owner: '{{ theme.gitalk.owner }}',
            admin: ['{{ theme.gitalk.admin }}'],
            distractionFreeMode: true,
            body: location.href,
            createIssueManually: true
        });

        gitalk.render('gitalk_container');
    }

    {% if !theme.gitalk.click_show %}
      showGitalk();
    {% endif %}

  </script>
{% endif %}