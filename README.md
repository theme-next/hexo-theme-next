<div align="right">Language: :us:
<a title="Chinese" href="docs/zh-CN/README.md">:cn:</a>
<a title="Russian" href="docs/ru/README.md">:ru:</a></div>

# <div align="center"><a title="NexT website repository" href="https://github.com/theme-next/theme-next.org"><img align="center" width="56" height="56" src="https://raw.githubusercontent.com/theme-next/hexo-theme-next/master/source/images/logo.svg?sanitize=true"></a> e x T</div>

<p align="center">«NexT» is a high quality elegant <a href="http://hexo.io">Hexo</a> theme. It is crafted from scratch with love.</p>

<p align="center">
  <a href="https://www.codacy.com/app/theme-next/hexo-theme-next?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=theme-next/hexo-theme-next&amp;utm_campaign=Badge_Grade"><img src="https://api.codacy.com/project/badge/Grade/72f7fe7609c2438a92069f448e5a341a" title="Project Grade"></a>
  <a href="https://travis-ci.org/theme-next/hexo-theme-next?branch=master"><img src="https://travis-ci.org/theme-next/hexo-theme-next.svg?branch=master" title="Travis CI [Linux]"></a>
  <a href="https://crwd.in/theme-next"><img src="https://d322cqt584bo4o.cloudfront.net/theme-next/localized.svg" title="Add or improve translation in few seconds!"></a>
  <a href="https://github.com/theme-next/hexo-theme-next/releases"><img src="https://badge.fury.io/gh/theme-next%2Fhexo-theme-next.svg"></a>
  <a href="http://hexo.io"><img src="https://img.shields.io/badge/hexo-%3E%3D%203.5.0-blue.svg"></a>
  <a href="https://github.com/theme-next/hexo-theme-next/blob/master/LICENSE.md"><img src="https://img.shields.io/badge/license-%20AGPL-blue.svg"></a>
</p>

## Live Preview

* :heart_decoration: Muse scheme: [LEAFERx](https://leaferx.online) | [Alex LEE](http://saili.science) | [Miaia](https://11.tt)
* :six_pointed_star: Mist scheme: [Jeff](https://blog.zzbd.org) | [uchuhimo](http://uchuhimo.me) | [xirong](http://www.ixirong.com)
* :pisces: Pisces scheme: [Vi](http://notes.iissnan.com) | [Acris](https://acris.me) | [Jiaxi He](http://jiaxi.io)
* :gemini: Gemini scheme: [Ivan.Nginx](https://almostover.ru) | [Raincal](https://raincal.com) | [Dandy](https://dandyxu.me)

More «NexT» examples [here](https://github.com/iissnan/hexo-theme-next/issues/119).

## Installation

Simplest way to install is by cloning the entire repository:

   ```sh
   $ cd hexo
   $ git clone https://github.com/theme-next/hexo-theme-next themes/next
   ```

Or you can see [detailed installation instructions][docs-installation-url] if you want any other variant.

## Plugins

In NexT config now you can find dependencies on each module which was moved to external repositories which can be found by [main organization link](https://github.com/theme-next).

For example, if you want to use `fancybox` in your site, go to NexT config and see:

```yml
# Fancybox
# Dependencies: https://github.com/theme-next/theme-next-fancybox
fancybox: false
```

Then turn on `fancybox` and go to «Dependencies» link with installation instructions of this module.

### Exceptions

If you use cdn for any plugins, you need to replace your cdn link.

For example, if you want to use `fancybox` and you configured a cdn link, go to NexT config and see:

```yml
vendors:
  # ...
  # Some contents...
  # ...
  fancybox: # Set or update fancybox cdn url.
  fancybox_css: # Set or update fancybox cdn url.
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

**If you want to update from v5.1.x to v6.0.x, read [here][docs-update-5-1-x-url].**

## Known Bugs

For those who also encounter **«[Error: Cannot find module 'hexo-util'](https://github.com/iissnan/hexo-theme-next/issues/1490)»**, please check your NPM version.

* `> 3`: Still not work? Please remove `node_modules` directory and reinstall using `npm install`.
* `< 3`: Please add `hexo-util` explicitly via `npm install --save-dev hexo-util` to you site package deps.

## Contributing

Contribution is welcome, feel free to open an issue and fork. Waiting for your pull request.

## Feedback

* Ask a question on [Stack Overflow][stack-url].
* Request a new feature on [GitHub][contributing-url].
* Vote for [popular feature requests][feat-req-vote-url].
* Report a bug in [GitHub Issues][issues-url].
* Join to our [Gitter][gitter-url] / [Riot][riot-url] / [Telegram][t-chat-url] chats.
* Follow us with [Telegram Channel][t-news-url] for latest news.

## Third party applications

* :triangular_flag_on_post: <a title="Hexo Markdown Editor" href="https://github.com/zhuzhuyule/HexoEditor" target="_blank">HexoEditor</a>

[browser-image]: https://img.shields.io/badge/browser-%20chrome%20%7C%20firefox%20%7C%20opera%20%7C%20safari%20%7C%20ie%20%3E%3D%209-lightgrey.svg
[browser-url]: https://www.browserstack.com

[stack-url]: https://stackoverflow.com/questions/tagged/theme-next
[contributing-url]: https://github.com/theme-next/hexo-theme-next/blob/master/.github/CONTRIBUTING.md
[feat-req-vote-url]: https://github.com/theme-next/hexo-theme-next/issues?q=is%3Aopen+is%3Aissue+label%3Afeature-request+sort%3Areactions-%2B1-desc
[issues-url]: https://github.com/theme-next/hexo-theme-next/issues

[gitter-url]: https://gitter.im/theme-next
[riot-url]: https://riot.im/app/#/room/#NexT:matrix.org
[t-chat-url]: https://t.me/theme_next
[t-news-url]: https://t.me/theme_next_news

<!--[rel-image]: https://img.shields.io/github/release/theme-next/hexo-theme-next.svg-->
<!--[rel-image]: https://badge.fury.io/gh/theme-next%2Fhexo-theme-next.svg-->
<!--[mnt-image]: https://img.shields.io/maintenance/yes/2018.svg-->

[download-latest-url]: https://github.com/theme-next/hexo-theme-next/archive/master.zip
[releases-latest-url]: https://github.com/theme-next/hexo-theme-next/releases/latest
<!--[releases-url]: https://github.com/theme-next/hexo-theme-next/releases-->
[tags-url]: https://github.com/theme-next/hexo-theme-next/tags
[commits-url]: https://github.com/theme-next/hexo-theme-next/commits/master

[docs-installation-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/INSTALLATION.md
[docs-data-files-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/DATA-FILES.md
[docs-update-5-1-x-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/UPDATE-FROM-5.1.X.md

## Contributors

Thanks goes to these wonderful people ([emoji key](https://github.com/kentcdodds/all-contributors#emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->
| [<img src="https://avatars2.githubusercontent.com/u/16944225?v=4" width="100px;" alt="Ivan.Nginx"/><br /><sub><b>Ivan.Nginx</b></sub>](https://almostover.ru)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3Aivan-nginx "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=ivan-nginx "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=ivan-nginx "Documentation") [🤔](#ideas-ivan-nginx "Ideas, Planning, & Feedback") [📝](#blog-ivan-nginx "Blogposts") [👀](#review-ivan-nginx "Reviewed Pull Requests") [⚠️](https://github.com/theme-next/hexo-theme-next/commits?author=ivan-nginx "Tests") [🌍](#translation-ivan-nginx "Translation") | [<img src="https://avatars3.githubusercontent.com/u/8521181?v=4" width="100px;" alt="Alex LEE"/><br /><sub><b>Alex LEE</b></sub>](http://saili.science)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3Asli1989 "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=sli1989 "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=sli1989 "Documentation") [👀](#review-sli1989 "Reviewed Pull Requests") [⚠️](https://github.com/theme-next/hexo-theme-next/commits?author=sli1989 "Tests") [🌍](#translation-sli1989 "Translation") | [<img src="https://avatars1.githubusercontent.com/u/980449?v=4" width="100px;" alt="Tsanie Lily"/><br /><sub><b>Tsanie Lily</b></sub>](https://tsanie.us)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3Atsanie "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=tsanie "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=tsanie "Documentation") [👀](#review-tsanie "Reviewed Pull Requests") [⚠️](https://github.com/theme-next/hexo-theme-next/commits?author=tsanie "Tests") [🌍](#translation-tsanie "Translation") | [<img src="https://avatars1.githubusercontent.com/u/12459199?v=4" width="100px;" alt="Wafer Li"/><br /><sub><b>Wafer Li</b></sub>](https://wafer.li)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3Awafer-li "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=wafer-li "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=wafer-li "Documentation") [👀](#review-wafer-li "Reviewed Pull Requests") [⚠️](https://github.com/theme-next/hexo-theme-next/commits?author=wafer-li "Tests") [🌍](#translation-wafer-li "Translation") | [<img src="https://avatars2.githubusercontent.com/u/20595509?v=4" width="100px;" alt="Lawrence Ye"/><br /><sub><b>Lawrence Ye</b></sub>](https://leaferx.online)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3ALEAFERx "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=LEAFERx "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=LEAFERx "Documentation") [👀](#review-LEAFERx "Reviewed Pull Requests") [⚠️](https://github.com/theme-next/hexo-theme-next/commits?author=LEAFERx "Tests") [🌍](#translation-LEAFERx "Translation") | [<img src="https://avatars1.githubusercontent.com/u/9370547?v=4" width="100px;" alt="maple"/><br /><sub><b>maple</b></sub>](https://blog.maple3142.net/)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3Amaple3142 "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=maple3142 "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=maple3142 "Documentation") [👀](#review-maple3142 "Reviewed Pull Requests") [⚠️](https://github.com/theme-next/hexo-theme-next/commits?author=maple3142 "Tests") [🌍](#translation-maple3142 "Translation") | [<img src="https://avatars1.githubusercontent.com/u/6279478?v=4" width="100px;" alt="Raincal"/><br /><sub><b>Raincal</b></sub>](https://raincal.com)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3ARaincal "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=Raincal "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=Raincal "Documentation") [👀](#review-Raincal "Reviewed Pull Requests") [⚠️](https://github.com/theme-next/hexo-theme-next/commits?author=Raincal "Tests") |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| [<img src="https://avatars1.githubusercontent.com/u/7333266?v=4" width="100px;" alt="Rainy"/><br /><sub><b>Rainy</b></sub>](https://rainylog.com)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3Ageekrainy "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=geekrainy "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=geekrainy "Documentation") [👀](#review-geekrainy "Reviewed Pull Requests") [⚠️](https://github.com/theme-next/hexo-theme-next/commits?author=geekrainy "Tests") [🌍](#translation-geekrainy "Translation") | [<img src="https://avatars0.githubusercontent.com/u/34574198?v=4" width="100px;" alt="李皓奇"/><br /><sub><b>李皓奇</b></sub>](https://liolok.github.io/)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3Aliolok "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=liolok "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=liolok "Documentation") [👀](#review-liolok "Reviewed Pull Requests") [⚠️](https://github.com/theme-next/hexo-theme-next/commits?author=liolok "Tests") | [<img src="https://avatars2.githubusercontent.com/u/10877162?v=4" width="100px;" alt="Nine"/><br /><sub><b>Nine</b></sub>](http://ioliu.cn)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3AxCss "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=xCss "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=xCss "Documentation") [👀](#review-xCss "Reviewed Pull Requests") [⚠️](https://github.com/theme-next/hexo-theme-next/commits?author=xCss "Tests") | [<img src="https://avatars0.githubusercontent.com/u/12930377?v=4" width="100px;" alt="Clooooode"/><br /><sub><b>Clooooode</b></sub>](https://github.com/jackey8616)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3Ajackey8616 "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=jackey8616 "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=jackey8616 "Documentation") | [<img src="https://avatars3.githubusercontent.com/u/13825126?v=4" width="100px;" alt="Xu Song"/><br /><sub><b>Xu Song</b></sub>](https://github.com/xu-song)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3Axu-song "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=xu-song "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=xu-song "Documentation") | [<img src="https://avatars3.githubusercontent.com/u/10931391?v=4" width="100px;" alt="Jack Sullivan"/><br /><sub><b>Jack Sullivan</b></sub>](https://github.com/HuntedCodes)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3AHuntedCodes "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=HuntedCodes "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=HuntedCodes "Documentation") | [<img src="https://avatars1.githubusercontent.com/u/24768249?v=4" width="100px;" alt="dpyzo0o"/><br /><sub><b>dpyzo0o</b></sub>](https://github.com/dpyzo0o)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3Adpyzo0o "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=dpyzo0o "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=dpyzo0o "Documentation") |
| [<img src="https://avatars1.githubusercontent.com/u/11242146?v=4" width="100px;" alt="zhuzhuxia"/><br /><sub><b>zhuzhuxia</b></sub>](http://zhuzhuyule.com)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3Azhuzhuyule "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=zhuzhuyule "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=zhuzhuyule "Documentation") | [<img src="https://avatars0.githubusercontent.com/u/25771340?v=4" width="100px;" alt="kuleyu"/><br /><sub><b>kuleyu</b></sub>](https://kuleyu-hugo.netlify.com/)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3Akuleyu "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=kuleyu "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=kuleyu "Documentation") | [<img src="https://avatars2.githubusercontent.com/u/16662357?v=4" width="100px;" alt="jdhao"/><br /><sub><b>jdhao</b></sub>](http://jdhao.github.io)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3Ajdhao "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=jdhao "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=jdhao "Documentation") | [<img src="https://avatars1.githubusercontent.com/u/18282328?v=4" width="100px;" alt="AlbertGao"/><br /><sub><b>AlbertGao</b></sub>](http://www.albertgao.xyz)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3AAlbert-Gao "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=Albert-Gao "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=Albert-Gao "Documentation") | [<img src="https://avatars0.githubusercontent.com/u/11273093?v=4" width="100px;" alt="YoshinoriN"/><br /><sub><b>YoshinoriN</b></sub>](https://yoshinorin.net/)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3AYoshinoriN "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=YoshinoriN "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=YoshinoriN "Documentation") | [<img src="https://avatars3.githubusercontent.com/u/25344334?v=4" width="100px;" alt="Qi Zhao"/><br /><sub><b>Qi Zhao</b></sub>](https://zhaoqi99.github.io/)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3AZhaoQi99 "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=ZhaoQi99 "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=ZhaoQi99 "Documentation") | [<img src="https://avatars2.githubusercontent.com/u/6239652?v=4" width="100px;" alt="Henry Zhu"/><br /><sub><b>Henry Zhu</b></sub>](https://changchen.me/)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3Adaya0576 "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=daya0576 "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=daya0576 "Documentation") |
| [<img src="https://avatars1.githubusercontent.com/u/8132652?v=4" width="100px;" alt="CxyFreedom"/><br /><sub><b>CxyFreedom</b></sub>](https://github.com/cxyfreedom)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3Acxyfreedom "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=cxyfreedom "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=cxyfreedom "Documentation") | [<img src="https://avatars1.githubusercontent.com/u/13927774?v=4" width="100px;" alt="KaitoHH"/><br /><sub><b>KaitoHH</b></sub>](https://kaitohh.com/)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3AKaitoHH "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=KaitoHH "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=KaitoHH "Documentation") | [<img src="https://avatars2.githubusercontent.com/u/35387985?v=4" width="100px;" alt="赵俊"/><br /><sub><b>赵俊</b></sub>](http://www.zhaojun.im)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3Azhaojun1998 "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=zhaojun1998 "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=zhaojun1998 "Documentation") | [<img src="https://avatars2.githubusercontent.com/u/13059924?v=4" width="100px;" alt="zyhang"/><br /><sub><b>zyhang</b></sub>](https://github.com/izyhang)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3Aizyhang "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=izyhang "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=izyhang "Documentation") | [<img src="https://avatars2.githubusercontent.com/u/18529307?v=4" width="100px;" alt="Xiaolong Yang"/><br /><sub><b>Xiaolong Yang</b></sub>](https://xiaolony.github.io)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3AXiaolonY "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=XiaolonY "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=XiaolonY "Documentation") | [<img src="https://avatars1.githubusercontent.com/u/15226118?v=4" width="100px;" alt="花蛄"/><br /><sub><b>花蛄</b></sub>](https://github.com/yzca)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3Ayzca "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=yzca "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=yzca "Documentation") | [<img src="https://avatars2.githubusercontent.com/u/1683936?v=4" width="100px;" alt="hengyunabc"/><br /><sub><b>hengyunabc</b></sub>](http://hengyunabc.github.io/)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3Ahengyunabc "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=hengyunabc "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=hengyunabc "Documentation") |
| [<img src="https://avatars2.githubusercontent.com/u/6104460?v=4" width="100px;" alt="Fisher Chang"/><br /><sub><b>Fisher Chang</b></sub>](http://bluefisher.github.io)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3ABlueFisher "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=BlueFisher "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=BlueFisher "Documentation") | [<img src="https://avatars2.githubusercontent.com/u/4521477?v=4" width="100px;" alt="Chanson Shen"/><br /><sub><b>Chanson Shen</b></sub>](http://chansonshen.com/)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3Ashenchsh "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=shenchsh "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=shenchsh "Documentation") | [<img src="https://avatars2.githubusercontent.com/u/842383?v=4" width="100px;" alt="Thomas Yang"/><br /><sub><b>Thomas Yang</b></sub>](http://ywjno.com)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3Aywjno "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=ywjno "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=ywjno "Documentation") | [<img src="https://avatars3.githubusercontent.com/u/8149261?v=4" width="100px;" alt="Legendary Nacar"/><br /><sub><b>Legendary Nacar</b></sub>](http://legendarynacar.github.io)<br />[🌍](#translation-legendarynacar "Translation") | [<img src="https://avatars0.githubusercontent.com/u/19174234?v=4" width="100px;" alt="rikusen0335"/><br /><sub><b>rikusen0335</b></sub>](https://github.com/Rikusen0335)<br />[🌍](#translation-Rikusen0335 "Translation") | [<img src="https://avatars3.githubusercontent.com/u/15902347?v=4" width="100px;" alt="Mr.J"/><br /><sub><b>Mr.J</b></sub>](https://www.dnocm.com)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3AJiangTJ "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=JiangTJ "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=JiangTJ "Documentation") | [<img src="https://avatars3.githubusercontent.com/u/29083921?v=4" width="100px;" alt="1v9"/><br /><sub><b>1v9</b></sub>](https://1v9.im)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3A1v9 "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=1v9 "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=1v9 "Documentation") |
| [<img src="https://avatars1.githubusercontent.com/u/16272760?v=4" width="100px;" alt="Mimi"/><br /><sub><b>Mimi</b></sub>](https://zhangshuqiao.org)<br />[🐛](https://github.com/theme-next/hexo-theme-next/issues?q=author%3Astevenjoezhang "Bug reports") [💻](https://github.com/theme-next/hexo-theme-next/commits?author=stevenjoezhang "Code") [📖](https://github.com/theme-next/hexo-theme-next/commits?author=stevenjoezhang "Documentation") |
<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/kentcdodds/all-contributors) specification. Contributions of any kind welcome!
