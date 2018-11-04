{% if page.comments && theme.gitalk.enable %}
  <link rel="stylesheet" href=" {{ theme.gitalk.gitalk_cdn_prefix }}gitalk.css">
  <script type="text/javascript" src="{{ theme.gitalk.gitalk_cdn_prefix }}gitalk.min.js"></script>
  <script type="text/javascript" src="{{ theme.gitalk.md5_cdn }}"></script>
   <script type="text/javascript">
        var gitalk = new Gitalk({
          clientID: '{{ theme.gitalk.client_id }}',
          clientSecret: '{{ theme.gitalk.client_secret }}',
          repo: '{{ theme.gitalk.repo }}',
          owner: '{{ theme.gitalk.github_id }}',
          admin: ['{{ theme.gitalk.admin_user }}'],
          id: md5(location.pathname),
          distractionFreeMode: '{{ theme.gitalk.distraction_free_mode }}'
        })
        gitalk.render('gitalk-container')           
       </script>
{% endif %}