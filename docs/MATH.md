<h1 align="center">Math Equations</h1>

NexT provides render engine for displaying Math Equations.

With using this feature, you don't need to manually import any JS or CSS. Just need to turn on `enable` of `math` and choose a render `engine` for it (located in `next/_config.yml`):

```yml
math:
  enable: true
  ...
  engine: mathjax
```

Notice: only turn on `enable` of `math` **cannot let you see the displayed equations correctly**, you need to install **corresponding Hexo Renderer** to fully support display the Math Equations.
The corresponding Hexo Renderer per engine will provide below.

<h2 align="center">Provided Render Engine</h2>

For now, NexT provides two Render Engines: [MathJax](https://www.mathjax.org/) and [Katex](https://khan.github.io/KaTeX/) (default is MathJax).

### MathJax (default)

If you use MathJax to render Math Equations, you need to use **only one of them**: [hexo-renderer-pandoc](https://github.com/wzpan/hexo-renderer-pandoc) or [hexo-renderer-kramed](https://github.com/sun11/hexo-renderer-kramed).

Firstly, you need to uninstall the original renderer `hexo-renderer-marked`, and install one of them above:

```sh
npm un hexo-renderer-marked --save
npm i hexo-renderer-pandoc --save # or hexo-renderer-kramed
```

Secondly, in `next/_config.yml`, turn on `enable` of `math` and choose `mathjax` as `engine`.

```yml
math:
  enable: true
  ...
  engine: mathjax
  #engine: katex
```

Finally, run standart Hexo generate, deploy process or start the server:

```sh
hexo clean && hexo g -d
# or hexo clean && hexo s
```

### Katex

The Katex engine is a **much faster** math render engine compared to MathJax. And it could survive without JavaScript.

But, what Katex supports is not as full as the MathJax does. You could check it from the Useful Links below.

If you use Katex to render Math Equations, you need to use **only one of those renderer**: [hexo-renderer-markdown-it-plus](https://github.com/CHENXCHEN/hexo-renderer-markdown-it-plus) or [hexo-renderer-markdown-it](https://github.com/hexojs/hexo-renderer-markdown-it).

Firstly, you need to uninstall the original renderer `hexo-renderer-marked`, and **install one of selected above**.

```sh
npm un hexo-renderer-marked --save
npm i hexo-renderer-markdown-it-plus --save
# or hexo-renderer-markdown-it
```

Secondly, in `next/_config.yml`, turn on `enable` option of `math` and choose `katex` as render `engine`.

```yml
math:
  enable: true
  ...
  #engine: mathjax
  engine: katex
```

Finally, run the standart Hexo generate, deploy process or start the server:

```sh
hexo clean && hexo g -d
# or hexo clean && hexo s
```

#### If you use hexo-renderer-markdown-it

If you use `hexo-renderer-markdown-it`，you also need to add `markdown-it-katex` as its plugin：

```
npm i markdown-it-katex --save
```

And then in `hexo/_config.yml` you need to add `markdown-it-katex` as a plugin for `hexo-renderer-markdown-it`:

```yml
# config of hexo-renderer-markdown-it
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

#### Known Bugs

1. Firstly, please check [Common Issues](https://github.com/Khan/KaTeX#common-issues) of Katex.
2. Displayed Math (i.e. `$$...$$`) needs to started with new clear line.\
   In other words: you must not have any characters (except of whitespaces) **before the opening `$$` and after the ending `$$`** ([comment #32](https://github.com/theme-next/hexo-theme-next/pull/32#issuecomment-357489509)).
3. Don't support Unicode ([comment #32](https://github.com/theme-next/hexo-theme-next/pull/32#issuecomment-357489509)).
4. Inline Math (..`$...$`) must not have whitespaces **after the opening `$` and before the ending `$`** ([comment #32](https://github.com/theme-next/hexo-theme-next/pull/32#issuecomment-357489509)).
5. If you use math in Heading (i.e. `## Heading`).\
   Then in corresponding TOC item it will show the related LaTex code 3 times ([comment #32](https://github.com/theme-next/hexo-theme-next/pull/32#issuecomment-359018694)).
6. If you use math in your post's title, it will not be rendered ([comment #32](https://github.com/theme-next/hexo-theme-next/pull/32#issuecomment-359142879)).

We currently use Katex 0.7.1, some of those bugs might cause by the outdated version of Katex we used.

But, as described in beginning, the render of Math Equations relies on Hexo Renderer. Currently, Katex related renderer only support until 0.7.1.

We will continuously monitor the updates of corresponding renderers, if there is a renderer which supports newer version of Katex, we will update the Katex we use.

### Useful Links

* [Speedtest between Katex and MathJax](https://www.intmath.com/cg5/katex-mathjax-comparison.php)
* [Function support by Katex](https://khan.github.io/KaTeX/function-support.html)

<h2 align="center">Configuration Specifications</h2>

ATTENTION! When you edit those configs, **don't change indentation!**

Currently, all NexT config use **2 spaces indents**.

If your content of config just directly after the config name, then a space is needed between the colon and the config content (i.e. `enable: true`)

```yml
# Math Equations Render Support
math:
  enable: false

  # Default(true) will load mathjax/katex srcipt EVERY PAGE
  # If you set to false, you need to add 'mathjax: true' in Front Matter of post
  # in order to render math equations in post
  per_page: true

  engine: mathjax
  #engine: katex

  # hexo-rendering-pandoc (or hexo-renderer-kramed) needed to full MathJax support.
  mathjax:
    # For newMathJax CDN (cdnjs.cloudflare.com) with fallback to oldMathJax (cdn.mathjax.org).
    cdn: //cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML
    # For direct link to MathJax.js with CloudFlare CDN (cdnjs.cloudflare.com).
    #cdn: //cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML
    # For automatic detect latest version link to MathJax.js and get from CloudFlare.
    #cdn: //cdn.bootcss.com/mathjax/2.7.1/latest.js?config=TeX-AMS-MML_HTMLorMML

  # hexo-renderer-markdown-it-plus (or hexo-renderer-markdown-it with markdown-it-katex plugin)
  # needed to full Katex support.
  katex:
    # Use Katex 0.7.1 as default
    cdn: //cdnjs.cloudflare.com/ajax/libs/KaTeX/0.7.1/katex.min.css
    # If you want to try the latest version of Katex, use one below instead
    #cdn: //cdn.jsdelivr.net/katex/latest/katex.min.css

```

### enable

`true` or `false`, default is `false`.

`true` to turn on render of Math Equations, `false` to off it.

### per_page

`true` or `false`, default is `true`.

This option is to control whether to render Math Equations every page.

The behavior of default (`true`) is to render Math Equations on **every page**.

When you set it to `false`, it will only render the post with `mathjax: true` Front Matter.

If your post's Front Matter doesn't have `mathjax: true` or you set `mathjax: false`, then NexT will not render Math Equations for those posts.

For example:

```md
<!-- This post will render the Math Equations -->
---
title: 'Will Render Math'
mathjax: true
---
....
```

```md
<!-- This post will NOT render the Math Equations -->
---
title: 'Not Render Math'
mathjax: false
---
....
```

```md
<!-- This post will NOT render the Math Equations either -->
---
title: 'Not Render Math Either'
---
....
```

### cdn

Both MathJax and Katex provide a config `cdn`, if you don't know what is `cdn`, **do not touch it**.

For MathJax, we use a fallback CDN as default and provide other CDN as optional.

For Katex, we use cdnjs as the default CDN and use the Katex 0.7.1 version. Due to the problem described above, if you need to use other CDN, please use the Katex 0.7.1 version.
Of cause, we also provide a CDN which could automatically use the latest version of Katex, if you want to check the effect of it.
