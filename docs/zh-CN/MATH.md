<h1 align="center">数学公式</h1>

NexT 内部提供数学公式渲染的引擎，这样你就不需要自己手动在模板中引入 JS 或者 CSS；
只需要将 `next/_config.yml` 中 `math` 的 `enable` 选项改为 `true`，并选择对应的渲染引擎即可：


```yml
math:
  enable: true
  ...
  engine: mathjax
```


需要注意的是，仅仅将 `math` 的 `enable` 打开**并不能让你看到数学公式**，你还需要**使用对应的 Hexo 渲染器(Renderer)** 才能真正在博客页面中显示出数学公式。引擎对应使用的 Hexo 渲染器会在引擎相关的部分介绍。

<h2 align="center">提供的渲染引擎</h2>

目前，NexT 提供两种数学公式渲染引擎，分别为 [MathJax](https://www.mathjax.org/) 和 [Katex](https://khan.github.io/KaTeX/)，默认为 MathJax。

### MathJax(默认)

如果你选择使用 MathJax 进行数学公式渲染，你需要使用 [hexo-renderer-pandoc](https://github.com/wzpan/hexo-renderer-pandoc) 或者 [hexo-renderer-kramed](https://github.com/sun11/hexo-renderer-kramed) 这两个渲染器的其中一个。

首先，卸载原有的渲染器 `hexo-renderer-marked`，并安装这两种渲染器的**其中一个**：

```sh
npm un hexo-renderer-marked --save
npm i hexo-renderer-pandoc --save # 或者 hexo-renderer-kramed
```


然后在 `next/_config.yml` 中将 `math` 的 `enable` 打开，并选择 `mathjax` 作为渲染引擎。

```yml
math:
  enable: true
  ...
  engine: mathjax
  #engine: katex
```

执行 Hexo 生成，部署，或者启动服务器：

```sh
hexo clean && hexo g -d
# 或者 hexo clean && hexo s
```

### Katex

Katex 渲染引擎相对于 MathJax 来说**大大提高了速度**，而且在关掉 JavaScript 时也能渲染数学公式。

但是 Katex 所支持的东西没有 MathJax 全面，你可以从下面的相关链接中获取更多的信息。

如果你选择使用 Katex 进行数学公式渲染，你需要使用 [hexo-renderer-markdown-it-plus](https://github.com/CHENXCHEN/hexo-renderer-markdown-it-plus) 或者 [hexo-renderer-markdown-it](https://github.com/hexojs/hexo-renderer-markdown-it) 这两种渲染器的其中一个。

首先，卸载原有的渲染器 `hexo-renderer-marked`，并安装这两种渲染器的**其中一个**：

```sh
npm un hexo-renderer-marked --save
npm i hexo-renderer-markdown-it-plus --save
# 或者 hexo-renderer-markdown-it
```


然后在 `next/_config.yml` 中将 `math` 的 `enable` 打开，并选择 `katex` 作为渲染引擎。

```yml
math:
  enable: true
  ...
  #engine: mathjax
  engine: katex
```

执行 Hexo 生成，部署，或者启动服务器：

```sh
hexo clean && hexo g -d
# 或者 hexo clean && hexo s
```

#### 如果你使用 hexo-renderer-markdown-it

如果你使用 `hexo-renderer-markdown-it`，你还需要为其加上 `markdown-it-katex` 作为插件：

```
npm i markdown-it-katex --save
```

然后在 `hexo/_config.yml` 中将 `markdown-it-katex` 作为插件写入 `hexo-renderer-markdown-it` 的配置中：

```yml
markdown:
  render:
    html: true
    xhtmlOut: false
    breaks: true
    linkify: true
    typographer: true
    quotes: '“”‘’'
  plugins:
    - markdown-it-katex
```

#### 已知的问题

1. 首先请查阅 Katex 的 [Common Issue](https://github.com/Khan/KaTeX#common-issues)
2. 块级公式(例如 `$$...$$`)必须位于空行。\
   即在开头的 `$$` 前和在结尾的 `$$` 后不能有除了空白字符以外的其他字符。([#32comment](https://github.com/theme-next/hexo-theme-next/pull/32#issuecomment-357489509))
3. 不支持 Unicode。([#32comment](https://github.com/theme-next/hexo-theme-next/pull/32#issuecomment-357489509))
4. 行内公式(例如 `$...$`)在开头的 `$` 后面和结尾的 `$` 前面**不能含有空格**。([#32comment](https://github.com/theme-next/hexo-theme-next/pull/32#issuecomment-357489509))
5. 如果你在文章的各级标题中(例如 `## 标题`)使用公式。\
   那么文章目录中的这个标题会出现 3 次未渲染的公式代码([#32comment](https://github.com/theme-next/hexo-theme-next/pull/32#issuecomment-359018694))
6. 如果你在文章 Title 中使用公式，那么公式将不会被渲染。([#32comment](https://github.com/theme-next/hexo-theme-next/pull/32#issuecomment-359142879))


我们目前使用的 Katex 版本为 0.7.1，这里面可能有某些问题是因为 Katex 版本老旧导致的；

但是，就像上面所说的，数学公式的渲染必须依靠渲染器来支持，目前的 Katex 相关的渲染器仅支持到 Katex 0.7.1；

我们会持续关注相关渲染器的更新，如果有渲染器支持更高版本的 Katex，我们会及时更新我们的 Katex 版本。

### 相关链接

* [Katex 与 MathJax 渲染速度对比](https://www.intmath.com/cg5/katex-mathjax-comparison.php)
* [Katex 支持的功能列表](https://khan.github.io/KaTeX/function-support.html)

<h2 align="center">相关配置说明</h2>

注意，在修改配置选项时，**不要更改配置的缩进**；

目前，NexT 的所有配置都采用**2 空格的缩进**；

如果配置的内容接在冒号后面，那么内容和冒号之间必须有一个空格(例如`enable: true`)

```yml

# Math Equations Render Support
math:
  enable: false

  # Default(true) will load mathjax/katex script on demand
  # That is it only render those page who has 'mathjax: true' in Front Matter.
  # If you set it to false, it will load mathjax/katex srcipt EVERY PAGE.
  per_page: true

  engine: mathjax
  #engine: katex

  # hexo-rendering-pandoc (or hexo-renderer-kramed) needed to full MathJax support.
  mathjax:
    # Use 2.7.1 as default, jsdelivr as default CDN, works everywhere even in China
    cdn: //cdn.jsdelivr.net/npm/mathjax@2.7.1/MathJax.js?config=TeX-AMS-MML_HTMLorMML
    # For newMathJax CDN (cdnjs.cloudflare.com) with fallback to oldMathJax (cdn.mathjax.org).
    #cdn: //cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML
    # For direct link to MathJax.js with CloudFlare CDN (cdnjs.cloudflare.com).
    #cdn: //cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML
    # For automatic detect latest version link to MathJax.js and get from Bootcss.
    #cdn: //cdn.bootcss.com/mathjax/2.7.1/latest.js?config=TeX-AMS-MML_HTMLorMML

  # hexo-renderer-markdown-it-plus (or hexo-renderer-markdown-it with markdown-it-katex plugin)
  # needed to full Katex support.
  katex:
    # Use 0.7.1 as default, jsdelivr as default CDN, works everywhere even in China
    cdn: //cdn.jsdelivr.net/npm/katex@0.7.1/dist/katex.min.css
    # CDNJS, provided by cloudflare, maybe the best CDN, but not works in China
    #cdn: //cdnjs.cloudflare.com/ajax/libs/KaTeX/0.7.1/katex.min.css
    # Bootcss, works great in China, but not so well in other region
    #cdn: //cdn.bootcss.com/KaTeX/0.7.1/katex.min.css
```

### enable

`true` 或者 `false`，默认为 `false`。

`true` 是打开数学公式渲染，`false` 则是关闭。

### per_page

`true` 或者 `false`，默认为 `true`。

这个选项是控制是否在每篇文章都渲染数学公式；

默认(`true`) 的行为是**只对 Front Matter 中含有 `mathjax: true` 的文章进行数学公式渲染**。

如果 Front Matter 中不含有 `mathjax: true`，或者 `mathjax: false`，那么 NexT 将不会对这些文章进行数学公式渲染。

例如：

```md
<!-- 这篇文章会渲染数学公式 -->
---
title: 'Will Render Math'
mathjax: true
---
....
```

```md
<!-- 这篇文章不会渲染数学公式 -->
---
title: 'Not Render Math'
mathjax: false
---
....
```

```md
<!-- 这篇文章也不会渲染数学公式 -->
---
title: 'Not Render Math Either'
---
....
```

当你将它设置为 `false` 时，它就会在每个页面都加载 MathJax 或者 Katex 来进行数学公式渲染。

### cdn

MathJax 和 Katex 都提供了 `cdn` 的配置，如果你不知道什么是 `cdn` ，**请不要修改这个配置**。

首先，MathJax 和 Katex 都使用了 [jsDelivr](https://www.jsdelivr.com/) 作为默认 CDN；

之所以选择 jsDelivr 是因为它在全球各地都有比较不错的速度，而且具有中国官方颁布的 ICP 证书，在中国也能比较好地访问。

同时，我们也提供了其他的 CDN 备选方案，包括著名的 [CDNJS](https://cdnjs.com/) 和在中国地区具有不错访问效果的 [Bootcss](http://www.bootcdn.cn/)。

对于 MathJax 来说，我们目前采用的版本为 2.7.1。

对于 Katex，由于上面提到的版本问题，我们目前采用的版本为 0.7.1。

如果你想尝试我们提供的备选方案以外的 CDN，请注意使用对应的版本。

特别的，对于中国的博客主，或者您的博客访问大部分来源于中国，由于 CDNJS 在部分中国地区被墙，请不要使用 CDNJS 作为 CDN。
