<h1 align="center">Reading Progress for <a href="https://github.com/theme-next">NexT</a></h1>

<h1 align="center">Installation</h1>

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
$ git clone https://github.com/theme-next/theme-next-reading-progress source/lib/reading_progress
```

<h2 align="center">Step 3 &rarr; Set it up</h2>

Enable module in **NexT** `_config.yml` file:

```yml
reading_progress:
  enable: true
  color: "#37c6c0"
  height: 2px
```

<h1 align="center">Update</h1>

```sh
$ cd themes/next/source/lib/reading_progress
$ git pull
```
