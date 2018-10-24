{% if page.comments && theme.gitalk.enable %}

<link rel="stylesheet" href="https://unpkg.com/gitalk/dist/gitalk.css">
<script src="https://unpkg.com/gitalk/dist/gitalk.min.js"></script>
<script src="https://cdn.bootcss.com/blueimp-md5/2.10.0/js/md5.js"></script>

<script type="text/javascript">
      var gitalk = new Gitalk({
        clientID: '{{ theme.gitalk.clientID }}',
        clientSecret: '{{ theme.gitalk.clientSecret }}',
        repo: '{{ theme.gitalk.repo }}',
        owner: '{{ theme.gitalk.owner }}',
        admin: ['{{ theme.gitalk.admin }}'],
        id: md5(window.location.pathname),
        labels: ['gitalk'],
        perPage: 50,
        language: 'zh-CN',
        distractionFreeMode: true
      });
      gitalk.render('gitalk-container');
</script>

{% endif %}