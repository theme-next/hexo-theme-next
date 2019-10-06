<div align="right">
  Language:
  :us:
  <a title="Chinese" href="docs/zh-CN/README.md">:cn:</a>
  <a title="Russian" href="docs/ru/README.md">:ru:</a>
</div>

# <div align="center"><a title="NexT website repository" href="https://github.com/theme-next/theme-next.org"><img align="center" width="56" height="56" src="https://raw.githubusercontent.com/theme-next/hexo-theme-next/master/source/images/logo.svg?sanitize=true"></a> e x T</div>

<p align="center">
  «NexT» is a high quality elegant <a href="https://hexo.io">Hexo</a> theme. It is crafted from scratch with love.
<br>
<br>
  <a href="https://github.com/theme-next/hexo-theme-next/releases"><img src="https://img.shields.io/github/package-json/v/theme-next/hexo-theme-next?style=flat-square"></a>
  <a href="https://hexo.io"><img src="https://img.shields.io/badge/hexo-%3E%3D%203.5.0-blue?style=flat-square"></a>
  <a href="https://www.browserstack.com"><img src="https://img.shields.io/badge/browser-%20chrome%20%7C%20firefox%20%7C%20opera%20%7C%20safari-blue?style=flat-square"></a>
  <a href="https://github.com/theme-next/hexo-theme-next/blob/master/LICENSE.md"><img src="https://img.shields.io/badge/license-%20AGPL-blue?style=flat-square"></a>
<br>
  <a href="https://bestpractices.coreinfrastructure.org/projects/2625"><img src="https://img.shields.io/cii/level/2625?style=flat-square" title="Core Infrastructure Initiative Best Practices"></a>
  <a href="https://www.codacy.com/app/theme-next/hexo-theme-next?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=theme-next/hexo-theme-next&amp;utm_campaign=Badge_Grade"><img src="https://img.shields.io/codacy/grade/72f7fe7609c2438a92069f448e5a341a/master?style=flat-square" title="Project Grade"></a>
  <a href="https://travis-ci.org/theme-next/hexo-theme-next?branch=master"><img src="https://img.shields.io/travis/theme-next/hexo-theme-next/master?style=flat-square" title="Travis CI [Linux]"></a>
<br>
  <img src="https://user-images.githubusercontent.com/16272760/63487983-da41b080-c4df-11e9-951c-64883a8a5e9b.png">
</p>

## Live Preview

<p align="center">
  :heart_decoration: <a href="https://muse.theme-next.org">Muse</a> | :six_pointed_star: <a href="https://mist.theme-next.org">Mist</a> | :pisces: <a href="https://pisces.theme-next.org">Pisces</a> | :gemini: <a href="https://theme-next.org">Gemini</a>
<br>
<br>
  More «NexT» examples <a href="https://github.com/theme-next/awesome-next#live-preview">here</a>.
</p>

## Installation

The simplest way to install is to clone the entire repository:

```sh
$ cd hexo
$ git clone https://github.com/theme-next/hexo-theme-next themes/next
```

Or you can see [detailed installation instructions][docs-installation-url] if you want any other variant.

## Plugins

In NexT config now you can find dependencies on each module which was moved to external repositories which can be found by [main organization link](https://github.com/theme-next).

For example, if you want to enable `pjax` on your site, go to NexT config and see:

```yml
# Easily enable fast Ajax navigation on your website.
# Dependencies: https://github.com/theme-next/theme-next-pjax
pjax: false
```

Then turn on `pjax` and go to «Dependencies» link with installation instructions of this module.

### Configure CDN

If you use CDN for any plugins, you need to replace your CDN link.

For example, if you want to use `mediumzoom` and you configured a CDN link, go to NexT config and see:

```yml
vendors:
  # ...
  # Some contents...
  # ...
  mediumzoom: # Set or update mediumzoom CDN URL.
```

Instead of defining [main organization link](https://github.com/theme-next) for updates.

## Update

You can update to latest master branch by the following command:

```sh
$ cd themes/next
$ git pull
```

And if you see any error message during update (something like **«Commit your changes or stash them before you can merge»**), recommended to learn [Hexo data files][docs-data-files-url] feature.\
However, you can bypass update errors by using the `Commit`, `Stash` or `Reset` commands for local changes. See [here](https://stackoverflow.com/a/15745424/5861495) how to do it.

**If you want to update from v5.1.x to v6.0.x, read [this][docs-update-5-1-x-url].**

## Feedback

* Follow us with [Telegram Channel][t-news-url] for latest news.
* Join our [Telegram][t-chat-url] / [Gitter][gitter-url] / [Riot][riot-url] chats.
* Visit the [Awesome NexT][awesome-next-url] list.
* Report a bug in [GitHub Issues][issues-bug-url].
* Request a new feature on [GitHub][issues-feat-url].
* Vote for [popular feature requests][feat-req-vote-url].

## Contributing

Contribution is welcome, feel free to open an issue and fork. Waiting for your pull request.

## Thanks

<p align="center">
  «NexT» send special thanks to these great services that sponsor our core infrastructure:
<br>
<br>
  <a href="https://github.com"><img align="center" width="100" src="https://github.githubassets.com/images/modules/logos_page/GitHub-Logo.png"></a>
&nbsp;<a href="https://www.netlify.com"><img align="center" width="150" src="https://cdn.netlify.com/15ecf59b59c9d04b88097c6b5d2c7e8a7d1302d0/1b6d6/img/press/logos/full-logo-light.svg"></a>
<br>
<br>
  <sub>GitHub allows us to host the Git repository, Netlify allows us to distribute the documentation.</sub>
<br>
<br>
  <a href="https://crowdin.com"><img align="center" width="180" src="https://support.crowdin.com/assets/logos/crowdin-logo1-small.png"></a>
<br>
<br>
  <sub>Crowdin allows us to translate conveniently the documentation.</sub>
<br>
<br>
  <a href="https://codacy.com"><img align="center" width="155" src="https://user-images.githubusercontent.com/16944225/55026017-623f8f00-5002-11e9-88bf-0d6a5884c6c2.png"></a>
&nbsp;<a href="https://www.browserstack.com"><img align="center" width="140" src="https://www.browserstack.com/images/mail/browserstack-logo-footer.png"></a>
<br>
<br>
  <sub>Codacy allows us to run the test suite, BrowserStack allows us to test in real browsers.</sub>
</p>

[docs-installation-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/INSTALLATION.md
[docs-data-files-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/DATA-FILES.md
[docs-update-5-1-x-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/UPDATE-FROM-5.1.X.md

[t-news-url]: https://t.me/theme_next_news
[t-chat-url]: https://t.me/theme_next
[gitter-url]: https://gitter.im/theme-next
[riot-url]: https://riot.im/app/#/room/#theme-next:matrix.org

[awesome-next-url]: https://github.com/theme-next/awesome-next
[issues-bug-url]: https://github.com/theme-next/hexo-theme-next/issues/new?assignees=&labels=Bug&template=bug-report.md
[issues-feat-url]: https://github.com/theme-next/hexo-theme-next/issues/new?assignees=&labels=Feature+Request&template=feature-request.md
[feat-req-vote-url]: https://github.com/theme-next/hexo-theme-next/issues?q=is%3Aopen+is%3Aissue+label%3A%22Feature+Request%22+sort%3Areactions-%2B1-desc

<!--[download-latest-url]: https://github.com/theme-next/hexo-theme-next/archive/master.zip -->
<!--[releases-latest-url]: https://github.com/theme-next/hexo-theme-next/releases/latest -->
<!--[releases-url]: https://github.com/theme-next/hexo-theme-next/releases -->
<!--[tags-url]: https://github.com/theme-next/hexo-theme-next/tags -->
