<h1 align="center">Math Equations</h1>

NexT provides two render engines for displaying Math Equations.

If you choose to use this feature, you don't need to manually import any JS or CSS. You just need to choose a render engine and turn on `enable` for it (located in `next/_config.yml`).

Notice: only turning on `enable` **cannot let you see the displayed equations correctly**, you need to install the **corresponding Hexo Renderer** to fully support the display of Math Equations. The corresponding Hexo Renderer per engine will be provided below.

<h2 align="center">Provided Render Engine</h2>

For now, NexT provides two Render Engines: [MathJax](https://www.mathjax.org/) and [Katex](https://khan.github.io/KaTeX/).

### MathJax

If you use MathJax to render Math Equations, you need to use **only one of them**: [hexo-renderer-pandoc](https://github.com/wzpan/hexo-renderer-pandoc) or [hexo-renderer-kramed](https://github.com/sun11/hexo-renderer-kramed).

Firstly, you need to uninstall the original renderer `hexo-renderer-marked`, and install one of the renderer above:

```sh
npm uninstall hexo-renderer-marked
npm install hexo-renderer-pandoc # or hexo-renderer-kramed
```

Secondly, in `next/_config.yml`, turn on `enable` of `mathjax`.

```yml
math:
  ...
  mathjax:
    enable: true
```

Finally, run standard Hexo generate, deploy process or start the server:

```sh
hexo clean && hexo g -d
# or hexo clean && hexo s
```

#### Numbering and referring equations in MathJax

In the new version of NexT, we have added feature to automatically number equations and to refer to equations. We briefly describe how to use this feature below.

In general, to make the automatic equation numbering work, you have to wrap your LaTeX equations in `equation` environment. Using the plain old style (i.e., wrap an equation with two dollar signs in each side) will not work. How to refer to an equation? Just give a `\label{}` tag and then in your later text, use `\ref{}` or `\eqref{}` to refer it. Using `\eqref{}` is preferred since if you use `\ref{}`, there are no parentheses around the equation number. Below are some of the common scenarios for equation numbering.

For simple equations, use the following form to give a tag,

```latex
$$\begin{equation}
e=mc^2
\end{equation}\label{eq1}$$
```

Then, you can refer to this equation in your text easily by using something like

```
the famous matter-energy equation $\eqref{eq1}$ proposed by Einstein ...
```

For multi-line equations, inside the `equation` environment, you can use the `aligned` environment to split it into multiple lines:

```latex
$$\begin{equation}
\begin{aligned}
a &= b + c \\
  &= d + e + f + g \\
  &= h + i
\end{aligned}
\end{equation}\label{eq2}$$
```

We can use `align` environment to align multiple equations. Each of these equations will get its own numbers.

```
$$\begin{align}
a &= b + c \label{eq3} \\
x &= yz \label{eq4}\\
l &= m - n \label{eq5}
\end{align}$$
```

In the `align` environment, if you do not want to number one or some equations, just [use `\nonumber`](https://tex.stackexchange.com/questions/17528/show-equation-number-only-once-in-align-environment) right behind these equations. Like the following:

```latex
$$\begin{align}
-4 + 5x &= 2+y \nonumber  \\
 w+2 &= -1+w \\
 ab &= cb
\end{align}$$
```

Sometimes, you want to use more “exotic” style to refer your equation. You can use `\tag{}` to achieve this. For example:

```latex
$$x+1\over\sqrt{1-x^2} \tag{i}\label{eq_tag}$$
```

For more information, you can visit the [official MathJax documentation on equation numbering](http://docs.mathjax.org/en/latest/tex.html#automatic-equation-numbering). You can also visit this [post](https://jdhao.github.io/2018/01/25/hexo-mathjax-equation-number/) for more details.

### Katex

The Katex engine is a **much faster** math render engine compared to MathJax. And it could survive without JavaScript.

But, what Katex supports is not as full as MathJax. You could check it from the Useful Links below.

If you use Katex to render Math Equations, you need to use **only one of those renderer**: [hexo-renderer-markdown-it-plus](https://github.com/CHENXCHEN/hexo-renderer-markdown-it-plus) or [hexo-renderer-markdown-it](https://github.com/hexojs/hexo-renderer-markdown-it).

Firstly, you need to uninstall the original renderer `hexo-renderer-marked`, and **install one of selected above**.

```sh
npm uninstall hexo-renderer-marked
npm install hexo-renderer-markdown-it-plus
# or hexo-renderer-markdown-it
```

Secondly, in `next/_config.yml`, turn on `enable` option of `katex`.

```yml
math:
  ...
  katex:
    enable: true
```

Finally, run the standard Hexo generate, deploy process or start the server:

```sh
hexo clean && hexo g -d
# or hexo clean && hexo s
```

#### If you use hexo-renderer-markdown-it

If you use `hexo-renderer-markdown-it`，you also need to add `markdown-it-katex` as its plugin：

```
npm install markdown-it-katex
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
4. Inline Math (..`$...$`) must not have white spaces **after the opening `$` and before the ending `$`** ([comment #32](https://github.com/theme-next/hexo-theme-next/pull/32#issuecomment-357489509)).
5. If you use math in Heading (i.e. `## Heading`).\
   Then in corresponding TOC item it will show the related LaTex code 3 times ([comment #32](https://github.com/theme-next/hexo-theme-next/pull/32#issuecomment-359018694)).
6. If you use math in your post's title, it will not be rendered ([comment #32](https://github.com/theme-next/hexo-theme-next/pull/32#issuecomment-359142879)).

We currently use Katex 0.11.1, some of those bugs might be caused by the outdated version of Katex we use.

But, as what is described in the beginning, the render of Math Equations relies on Hexo Renderer. Currently, Katex-related renderers only support Katex version until 0.11.1.

We will continuously monitor the updates of corresponding renderers, if there is a renderer which supports newer version of Katex, we will update the Katex we use.

### Useful Links

* [Speed test between Katex and MathJax](https://www.intmath.com/cg5/katex-mathjax-comparison.php)
* [Function support by Katex](https://khan.github.io/KaTeX/function-support.html)

<h2 align="center">Configuration Specifications</h2>

ATTENTION! When you edit those configs, **don't change indentation!**

Currently, all NexT config use **2 spaces indents**.

If your content of config is put just directly after the config name, then a space is needed between the colon and the config content (i.e. `enable: true`)

```yml
# Math Formulas Render Support
math:
  # Default (true) will load mathjax / katex script on demand.
  # That is it only render those page which has `mathjax: true` in Front-matter.
  # If you set it to false, it will load mathjax / katex srcipt EVERY PAGE.
  per_page: true

  # hexo-renderer-pandoc (or hexo-renderer-kramed) required for full MathJax support.
  mathjax:
    enable: true
    # See: https://mhchem.github.io/MathJax-mhchem/
    mhchem: false

  # hexo-renderer-markdown-it-plus (or hexo-renderer-markdown-it with markdown-it-katex plugin) required for full Katex support.
  katex:
    enable: false
    # See: https://github.com/KaTeX/KaTeX/tree/master/contrib/copy-tex
    copy_tex: false
```

### `per_page`

`true` or `false`, default is `true`.

This option is to control whether to render Math Equations every page.

The behavior of default (`true`) is to render Math Equations **on demand**.

It will only render those posts which have `mathjax: true` in their Front-matter.

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

When you set it to `false`, the math will be rendered on **EVERY PAGE**.
