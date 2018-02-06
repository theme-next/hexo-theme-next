<div align="right">Language: :us:
<a title="Chinese" href="docs/zh-CN/README.md">:cn:</a>
<a title="Russian" href="docs/ru/README.md">:ru:</a></div>

# <div align="center"><a title="Go to homepage" href="https://theme-next.org"><img align="center" width="56" height="56" src="https://raw.githubusercontent.com/theme-next/hexo-theme-next/master/source/images/logo.svg?sanitize=true"></a> e x T</div>

<p align="center">«NexT» is a high quality elegant <a href="http://hexo.io">Hexo</a> theme. It is crafted from scratch, with love.</p>

[![gitter-image]][gitter-url]
[![riot-image]][riot-url]
[![t-chat-image]][t-chat-url]
[![t-news-image]][t-news-url]
[![lang-image]][lang-url]
[![travis-image]][travis-url]
[![rel-image]][releases-url]
[![hexo-image]][hexo-url]
[![lic-image]][lic-url]

## Live Preview

* :heart_decoration: Muse scheme: [LEAFERx](https://leaferx.online) | [XiaMo](https://notes.wanghao.work) | [OAwan](https://oawan.me)
* :six_pointed_star: Mist scheme: [Jeff](https://blog.zzbd.org) | [uchuhimo](http://uchuhimo.me) | [xirong](http://www.ixirong.com)
* :pisces: Pisces scheme: [Vi](http://notes.iissnan.com) | [Acris](https://acris.me) | [Rainy](https://rainylog.com)
* :gemini: Gemini scheme: [Ivan.Nginx](https://almostover.ru) | [Alynx](http://sh.alynx.xyz) | [Raincal](https://raincal.com)

More «NexT» examples [here](https://github.com/iissnan/hexo-theme-next/issues/119).

## Installation

Simplest way to install is by cloning whole repository:

   ```sh
   $ cd hexo
   $ git clone https://github.com/theme-next/hexo-theme-next themes/next
   ```

Or you can see [detailed installation instructions][docs-installation-url] if you want any other variant.

## Plugins

In NexT config now you can find dependencies on each module which was moved to external repositories which can be found by [main organization link](https://github.com/theme-next).

For example, you want to use `fancybox` in your site. Go to NexT config and see:

```yml
# Fancybox
# Dependencies: https://github.com/theme-next/theme-next-fancybox
fancybox: false
```

Then turn on `fancybox` and go to «Dependencies» link with installation instructions of this module.

## Update

You can update to latest master branch by the following command:

```sh
$ cd themes/next
$ git pull
```

And if you see any error message during update (something like **«Commit your changes or stash them before you can merge»**), recommended to learn [Hexo data files][docs-data-files-url] feature.\
Howbeit, you can bypass update errors by `Commit`, `Stash` or `Discard` local changes. See [here](https://stackoverflow.com/a/15745424/5861495) how to do it.

If you want to update from v5.1.x to v6.0.x, read [here][docs-update-5-1-x-url].

## Known Bugs

For those who also encounter **«[Error: Cannot find module 'hexo-util'](https://github.com/iissnan/hexo-theme-next/issues/1490)»**, please check your NPM version.

* `> 3`: Still not work? Please remove `node_modules` directory and reinstall using `npm install`.
* `< 3`: Please add `hexo-util` explicitly via `npm install --save-dev hexo-util` to you site package deps.

## Contributing

Contribution is welcome, feel free to open an issue and fork. Waiting for your pull request.

## Third party applications

* :triangular_flag_on_post: <a title="Hexo Markdown Editor" href="https://github.com/zhuzhuyule/HexoEditor" target="_blank">HexoEditor</a>

[browser-image]: https://img.shields.io/badge/browser-%20chrome%20%7C%20firefox%20%7C%20opera%20%7C%20safari%20%7C%20ie%20%3E%3D%209-lightgrey.svg
[browser-url]: https://www.browserstack.com

[lang-image]: https://d322cqt584bo4o.cloudfront.net/theme-next/localized.svg "Add or improve translation in few seconds!"
[lang-url]: https://crwd.in/theme-next

[gitter-image]: https://badges.gitter.im/Join%20Chat.svg
[gitter-url]: https://gitter.im/theme-next

[riot-image]: https://img.shields.io/badge/riot-join%20chat-green.svg
[riot-url]: https://riot.im/app/#/room/#NexT:matrix.org

[t-chat-image]: https://img.shields.io/badge/telegram-chat-lightgrey.svg
[t-chat-url]: https://t.me/joinchat/GUNHXA-vZkgSMuimL1VmMw

[t-news-image]: https://img.shields.io/badge/telegram-news-lightgrey.svg
[t-news-url]: https://t.me/theme_next

[travis-image]: https://travis-ci.org/theme-next/hexo-theme-next.svg?branch=master
[travis-url]: https://travis-ci.org/theme-next/hexo-theme-next?branch=master "Travis CI [Linux]"

[hexo-image]: https://img.shields.io/badge/hexo-%3E%3D%203.0-blue.svg
[hexo-url]: http://hexo.io

[lic-image]: https://img.shields.io/badge/license-%20AGPL-blue.svg
[lic-url]: https://github.com/theme-next/hexo-theme-next/blob/master/LICENSE.md

<!--[rel-image]: https://img.shields.io/github/release/theme-next/hexo-theme-next.svg-->
[rel-image]: https://badge.fury.io/gh/theme-next%2Fhexo-theme-next.svg
<!--[mnt-image]: https://img.shields.io/maintenance/yes/2018.svg-->

[download-latest-url]: https://github.com/theme-next/hexo-theme-next/archive/master.zip
[releases-latest-url]: https://github.com/theme-next/hexo-theme-next/releases/latest
[releases-url]: https://github.com/theme-next/hexo-theme-next/releases
[tags-url]: https://github.com/theme-next/hexo-theme-next/tags
[commits-url]: https://github.com/theme-next/hexo-theme-next/commits/master

[docs-installation-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/INSTALLATION.md
[docs-data-files-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/DATA-FILES.md
[docs-update-5-1-x-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/UPDATE-FROM-5.1.X.md
