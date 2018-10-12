<h1 align="center">Bookmark for <a href="https://github.com/theme-next">NexT</a></h1>

<h2 align="center">Introduce</h2>

Bookmark is a plugin that allow the users save their reading position.

The users could just click the bookmark icon (like 🔖) in left-top of the page to save the position.

And when they visit your blog in the next time, they can continue the last reading position by clicking the bookmark icon from the home page.

<h1 align="center">Installation</h1>

<h2>If you want to use the CDN instead of clone this repo, please jump to the Step 3.</h2>

<h2 align="center">Step 1 &rarr; Go to NexT dir</h2>

Change dir to **NexT** directory. There must be `layout`, `source`, `languages` and other directories:

```sh
$ cd themes/next
$ ls
bower.json  _config.yml  docs  gulpfile.coffee  languages  layout  LICENSE.md  package.json  README.md  scripts  source  test
```

<h2 align="center">Step 2 &rarr; Get module</h2>

Install module to `source/lib` directory:

```sh
$ git clone https://github.com/theme-next/theme-next-bookmark.git source/lib/bookmark
```

<h2 align="center">Step 3 &rarr; Set it up</h2>

Enable module in **NexT** `_config.yml` file:

```yml
bookmark: true
```

**And, if you wants to use the CDN, then need to set:**

```yml
vendors:
  ...
  bookmark: https://cdn.jsdelivr.net/gh/theme-next/theme-next-bookmark@latest/bookmark.min.js
```

<h1 align="center">Update</h1>

```sh
$ cd themes/next/source/lib/bookmark
$ git pull
```
