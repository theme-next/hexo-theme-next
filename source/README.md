---
title: 我又又又把博客迁移了
copyright: true
date: 2019-02-03 19:00:36
tags:
    - hexo
    - next
categories: 日常总结
keywords: hexo,全局搜索,CDN加载,懒加载,toc目录,rss feed,sitemap,git一键部署
---



好久维护博客，看了一下[Next主题]()的相关功能，最后决定将博客切到了hexo，原博客在这里。原[eiblog]()有些东西想去更新，一直没有动手，这里立个flag，有空了在eiblog基础上改些东西，大概有：

- [ ] 自动更新disqus js(每次js更新了，disqus就加载不了)
- [ ] 数据库切换到sqlite3 (用gorm支持多种数据库)
- [ ] 侧边栏可以自定义添加页面
- [ ] 更容易部署



<!--more-->



这次迁移到`Hexo`, 主要`Next`主题确实做的很完备啊。

- [x] 支持全局搜索
- [x] 支持CDN加速
- [x] 支持懒加载
- [x] 支持toc
- [x] 支持feed
- [x] 支持sitemap
- [x] 一键部署



### 全局搜索

修改主题内`_config.yml`

```yml
local_search:true
```

修改全局配置`_config.yml`

```
search:
  path: search.xml
  field: post
  format: html
  limit: 1000
```



### CDN全局加速

CDN能给站点的加载速度提高很多，一些`js`，`css`，图片资源都可以放到CDN上。

修改主题内`_config.yml`，设置`vendors`里面的CDN地址。

```yml
vendors:
  _internal: libs
  
  jquery: https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js
  
  fancybox_css: //cdn.jsdelivr.net/gh/fancyapps/fancybox@3/dist/jquery.fancybox.min.css
  
  ...
```

一般你做到这样就可以了，但我有点不相信这些CDN,  写了个`go`脚本把这些全部上传到七牛。。。



然后，我发现，`public`里面的`js`文件和图片每次生成都不会发生变化，于是我把这些都全到了七牛。。。

然后修改一下主题内`_config.yml`文件，把`Assets`修改如下：

```yml
css: css
js: https://st.razeen.cn/next/js
images: https://st.razeen.cn/next/image
```



### 图片懒加载

有些文章图片比较多，图片懒加载能让你需要看到图片的时候再加载图片，解释了很多浏览，能提高不好加载速度。

`Next`主题可以通过插件`tag`的方式支持懒加载。具体插件文档在[这里](https://theme-next.org/docs/tag-plugins/)。开启改功能我们需要安装`hexo-lazyload-image`插件, 然后在根目录执行`npm install hexo-lazyload-image --save`。

然后修改主题内`_config.yml`文件：

```yml
# Added switch option for separated repo in 6.0.0.
# Dependencies: https://github.com/theme-next/theme-next-jquery-lazyload
lazyload: true
```

懒加载格式如下：

```markdown
# 懒加载
{% fi https://st.razeen.cn/next/zhifubao.png@lazy, Alt text, Title text, 75% %}
{% fi https://st.razeen.cn/next/zhifubao.png @lazy, Alt text, Title text, 75% %}
```



### 支持TOC

toc是啥？就是目录。

修改主题内`_config.yml`即可。

```yml
# Table Of Contents in the Sidebar
toc:
  enable: true
  # Automatically add list number to toc.
  number: true
  # If true, all words will placed on next lines if header width longer then sidebar width.
  wrap: false
  # Maximum heading depth of generated toc. You can set it in one post through `toc_max_depth` var.
  max_depth: 6
```



### RSS Feed

支持RSS订阅，这个以前很火的。

先安装插件`hexo-generator-feed`。

```bash
$ npm install hexo-generator-feed --save
```

修改博客内插件`_config.yml`。

```yml
rss: true
```



### sitemap

为了方便搜索引擎收录，提高SEO，sitemap肯定需要的。

安装插件`hexo-generator-sitemap`,` hexo-generator-baidu-sitemap`。

```bash
$ npm install hexo-generator-sitemap --save
$ npm install hexo-generator-baidu-sitemap --save
```

修改根目录`_config.yml`, 添加如下：

```yml
sitemap:
   path: sitemap.xml
baidusitemap:
    path: baidusitemap.xml
```



### robots.txt

这也是提高SEO的，设置搜索引擎可以抓取哪些，不需要抓取哪些内容。

在`themes/source/next/source`目录下添加。

```
User-agent: *
Allow: /
Allow: /archives/
Allow: /categories/
Allow: /tags/
Allow: /about/

Disallow: /vendors/
Disallow: /js/
Disallow: /css/
Disallow: /fonts/
Disallow: /vendors/
Disallow: /fancybox/

Sitemap: https://razeen.me/sitemap.xml
Sitemap: https://razeen.me/baidusitemap.xml
```



### 一键部署

关于一键部署更多的内容看[这里](https://razeen.me/post/daily-hexo-auto-refresh.html)。



换个皮肤，希望自己新的一年里多写几篇博客～。