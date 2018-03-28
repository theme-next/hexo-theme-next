<div align="right">语言: <a title="英语" href="../../README.md">:us:</a>
:cn:
<a title="俄语" href="../../docs/ru/README.md">:ru:</a></div>

# <div align="center"><a title="Go to homepage" href="https://theme-next.org"><img align="center" width="56" height="56" src="https://raw.githubusercontent.com/theme-next/hexo-theme-next/master/source/images/logo.svg?sanitize=true"></a> e x T</div>

<p align="center">«NexT» 是一款风格优雅的高质量 <a href="http://hexo.io">Hexo</a> 主题，自点点滴滴中用爱雕琢而成。</p>

[![gitter-image]][gitter-url]
[![riot-image]][riot-url]
[![t-chat-image]][t-chat-url]
[![t-news-image]][t-news-url]
[![lang-image]][lang-url]
[![travis-image]][travis-url]
[![rel-image]][releases-url]
[![hexo-image]][hexo-url]
[![lic-image]][lic-url]

## 即时预览

* :heart_decoration: Muse 主题: [LEAFERx](https://leaferx.online) | [XiaMo](https://notes.wanghao.work) | [OAwan](https://oawan.me)
* :six_pointed_star: Mist 主题: [Jeff](https://blog.zzbd.org) | [uchuhimo](http://uchuhimo.me) | [xirong](http://www.ixirong.com)
* :pisces: Pisces 主题: [Vi](http://notes.iissnan.com) | [Acris](https://acris.me) | [Rainy](https://rainylog.com)
* :gemini: Gemini 主题: [Ivan.Nginx](https://almostover.ru) | [Raincal](https://raincal.com) | [Dandy](https://dandyxu.me)

更多 «NexT» 的例子参见[这里](https://github.com/iissnan/hexo-theme-next/issues/119)。

## 安装

最简单的安装方式是直接克隆整个仓库：

   ```sh
   $ cd hexo
   $ git clone https://github.com/theme-next/hexo-theme-next themes/next
   ```

此外，如果你想要使用其他方式，你也可以参见[详细安装步骤][docs-installation-url]。

## 插件

在 NexT 配置中你现在可以找到已经被移至外部仓库的依赖项。你可以在[组织主页](https://github.com/theme-next)中找到它们。

例如，假设你想要在你的站点中使用 `fancybox` 插件，请进入 NexT 配置文件，你会看到如下内容：

```yml
# Fancybox
# Dependencies: https://github.com/theme-next/theme-next-fancybox
fancybox: false
```

将 `fancybox` 配置项打开，进入它上面的 «Dependencies» 链接以查看它的安装步骤。

## 更新

你可以通过如下命令更新到最新的 master 分支：

```sh
$ cd themes/next
$ git pull
```

如果你在此过程中收到了任何错误报告 (例如 **«Commit your changes or stash them before you can merge»**)，我们推荐你使用 [Hexo 数据文件][docs-data-files-url]特性。\
然而你也可以通过提交（`Commit`）、贮藏（`Stash`）或忽视（`Discard`）本地更改以绕过这种更新错误。具体方法请参考[这里](https://stackoverflow.com/a/15745424/5861495)。

**如果你想要从 v5.1.x 更新到 v6.0.x，阅读[这篇文档][docs-update-5-1-x-url]。**

## 已知问题

对于仍然遇到 **«[Error: Cannot find module 'hexo-util'](https://github.com/iissnan/hexo-theme-next/issues/1490)»** 这一错误的用户，请检查你的 NPM 版本。

* `> 3`：仍然出现错误吗？请删除 `node_modules` 目录并通过 `npm install` 重新安装。
* `< 3`：请通过 `npm install --save-dev hexo-util` 将 `hexo-util` 依赖手动添加至你的站点依赖包中。

## 贡献你的代码

我们欢迎你贡献出你的一份力量，你可以随时提交 issue 或 fork 本仓库。静候你的 pull request。

## 第三方應用程序

* :triangular_flag_on_post: <a title="Hexo Markdown 编辑器" href="https://github.com/zhuzhuyule/HexoEditor" target="_blank">HexoEditor</a>

[browser-image]: https://img.shields.io/badge/browser-%20chrome%20%7C%20firefox%20%7C%20opera%20%7C%20safari%20%7C%20ie%20%3E%3D%209-lightgrey.svg
[browser-url]: https://www.browserstack.com

[lang-image]: https://d322cqt584bo4o.cloudfront.net/theme-next/localized.svg "请花几秒钟来添加或修正翻译！"
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

[hexo-image]: https://img.shields.io/badge/hexo-%3E%3D%203.3.5-blue.svg
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

[docs-installation-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/zh-CN/INSTALLATION.md
[docs-data-files-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/zh-CN/DATA-FILES.md
[docs-update-5-1-x-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/zh-CN/UPDATE-FROM-5.1.X.md
