{% if theme.growingio %}
  <!-- GrowingIO Analytics code version 2.1 -->
  <!-- Copyright 2015-2018 GrowingIO, Inc. More info available at http://www.growingio.com -->
  <script type='text/javascript'>
  !function(e,t,n,g,i){e[i]=e[i]||function(){(e[i].q=e[i].q||[]).push(arguments)},n=t.createElement("script"),tag=t.getElementsByTagName("script")[0],n.async=1,n.src=('https:'==document.location.protocol?'https://':'http://')+g,tag.parentNode.insertBefore(n,tag)}(window,document,"script","assets.growingio.com/2.1/gio.js","gio");
    gio('init','{{theme.growingio}}', {});
  //custom page code begin here
  //custom page code end here
  gio('send');
  </script>
{% endif %}
