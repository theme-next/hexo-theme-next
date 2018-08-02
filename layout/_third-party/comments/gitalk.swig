{% if theme.gitalk.enable and theme.gitalk.client_id %}
<!-- LOCAL: You can save these files to your site and update links -->
    {% set CommentsClass = "Gitalk" %}
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/gitalk@1/dist/gitalk.css">
    <script src="https://cdn.jsdelivr.net/npm/gitalk@1/dist/gitalk.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/blueimp-md5@2.10.0/js/md5.min.js"></script>
<!-- END LOCAL -->

    {% if theme.gitalk.cleanly %}
      <style>
        a.gitalk-editor-footer-tip { display: none; }
        .gitalk-container.gitalk-footer-container { display: none; }
      </style>
    {% endif %}

    {% if page.comments %}
      <script type="text/javascript">
      function renderGitalk(){
        var gitalk = new {{CommentsClass}}({
            id: md5(decodeURI(window.location.pathname)),
            owner: '{{ theme.gitalk.owner }}',
            repo: '{{ theme.gitalk.repo }}',
            admin: '{{ theme.gitalk.admin }}',
            clientID: "{{ theme.gitalk.client_id }}",
            clientSecret: "{{ theme.gitalk.client_secret }}"
            });
        gitalk.render('gitalk-container');
      }
      renderGitalk();
      </script>
    {% endif %}

{% endif %}
