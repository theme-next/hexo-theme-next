{% if page.comments && theme.gitalk.enable %}

  {% set gitalk_js_url = "//cdn.bootcss.com/gitalk/1.4.0/gitalk.min.js" %}
  {% if theme.vendors.gitalk_js %}
    {% set gitalk_js_url = theme.vendors.gitalk_js %}
  {% endif %}
  <script type="text/javascript" src="{{ gitalk_js_url }}"></script>

  {% set gitalk_css_url = "//cdn.bootcss.com/gitalk/1.4.0/gitalk.css" %}
  {% if theme.vendors.gitalk_css %}
    {% set gitalk_css_url = theme.vendors.gitalk_css %}
  {% endif %}
  <link rel="stylesheet" href="{{ gitalk_css_url }}">

  {% set md5_url = "//cdn.bootcss.com/blueimp-md5/2.10.0/js/md5.min.js" %}
  {% if theme.vendors.md5 %}
    {% set md5_url = theme.vendors.md5 %}
  {% endif %}
  <script type="text/javascript" src="{{ md5_url }}"></script>
    
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