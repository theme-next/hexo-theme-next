<div align="right">
  语言:
  <a title="英语" href="../../README.md">🇺🇸</a>
  🇨🇳
  <a title="俄语" href="../ru/README.md">🇷🇺</a>
</div>

# <div align="center"><a title="NexT website repository" href="https://github.com/theme-next/theme-next.org"><img align="center" width="56" height="56" src="https://raw.githubusercontent.com/theme-next/hexo-theme-next/master/source/images/logo.svg?sanitize=true"></a> e x T</div>

<p align="center">
  «NexT» 是一款风格优雅的高质量 <a href="https://hexo.io">Hexo</a> 主题，自点点滴滴中用爱雕琢而成。
<br>
<br>
  <a href="https://www.npmjs.com/package/hexo-theme-next"><img src="https://img.shields.io/github/package-json/v/theme-next/hexo-theme-next?style=flat-square"></a>
  <a href="https://nodejs.org"><img src="https://img.shields.io/badge/node-%3E=10.9.0-green?style=flat-square"></a>
  <a href="https://hexo.io"><img src="https://img.shields.io/badge/hexo-%3E=4.0.0-blue?style=flat-square&logo=hexo"></a>
  <a href="https://github.com/theme-next/hexo-theme-next/blob/master/LICENSE.md"><img src="https://img.shields.io/badge/license-%20AGPL-orange?style=flat-square&logo=gnu"></a>
<br>
  <a href="https://bestpractices.coreinfrastructure.org/projects/2625"><img src="https://img.shields.io/cii/level/2625?style=flat-square" title="Core Infrastructure Initiative Best Practices"></a>
  <a href="https://travis-ci.org/theme-next/hexo-theme-next?branch=master"><img src="https://img.shields.io/travis/theme-next/hexo-theme-next/master?style=flat-square&logo=travis%20ci" title="Travis CI [Linux]"></a>
  <a href="https://app.codacy.com/manual/theme-next/hexo-theme-next/dashboard"><img src="https://img.shields.io/codacy/grade/72f7fe7609c2438a92069f448e5a341a/master?style=flat-square&logo=codacy" title="Project Grade"></a>
  <img src="https://img.shields.io/snyk/vulnerabilities/github/theme-next/hexo-theme-next?style=flat-square" title="Vulnerabilities">
<br>
  <img src="https://user-images.githubusercontent.com/16272760/63487983-da41b080-c4df-11e9-951c-64883a8a5e9b.png">
</p>

## 即时预览

<p align="center">
  💟 <a href="https://muse.theme-next.org">Muse</a> | 🔯 <a href="https://mist.theme-next.org">Mist</a> | ♓️ <a href="https://pisces.theme-next.org">Pisces</a> | ♊️ <a href="https://theme-next.org">Gemini</a>
<br>
<br>
  更多 «NexT» 的例子参见<a href="https://github.com/theme-next/awesome-next#live-preview">这里</a>。
</p>

## 安装

最简单的安装方式是直接克隆整个仓库：

```sh
$ cd hexo
$ git clone https://github.com/theme-next/hexo-theme-next themes/next
```

此外，如果你想要使用其他方式，你也可以参见[详细安装步骤][docs-installation-url]。

## 插件

NexT 支持大量的第三方插件，它们可以被轻松地配置。

例如，你想要在你的站点中使用 `pjax` 插件，请进入 NexT 配置文件，启用 `pjax` 配置项：

```yml
# Easily enable fast Ajax navigation on your website.
# Dependencies: https://github.com/theme-next/theme-next-pjax
pjax: true
```

然后，打开它上面的 «Dependencies» 链接以查看它的安装步骤。

### 设置 CDN

如果你想要通过 CDN 来加载插件脚本，那么需要设置相关的 CDN 链接。

例如，你想要使用 `mediumzoom` 插件并通过 CDN 加载，进入 Next 配置文件并找到如下内容：

```yml
vendors:
  # ...
  # Some contents...
  # ...
  mediumzoom: # Set or update mediumzoom CDN URL.
```

## 更新

NexT 每个月都会发布新版本。你可以通过如下命令更新到最新的 master 分支：

```sh
$ cd themes/next
$ git pull
```

如果你在此过程中收到了任何错误报告 (例如 **«Commit your changes or stash them before you can merge»**)，我们推荐你使用 [Hexo 数据文件][docs-data-files-url]特性。\
然而你也可以通过提交（`Commit`）、贮藏（`Stash`）或忽视（`Discard`）本地更改以绕过这种更新错误。具体方法请参考[这里](https://stackoverflow.com/a/15745424/5861495)。

**如果你想要从 v5.1.x 更新到最新版本，阅读[这篇文档][docs-update-5-1-x-url]。**

## 反馈

* 浏览 [Awesome NexT][awesome-next-url] 列表，与其它用户分享插件和教程。
* 加入我们的 [Telegram][t-chat-url] / [Gitter][gitter-url] / [Riot][riot-url] 聊天。
* 请花几秒钟来[添加或修正翻译][i18n-url]。
* 在 [GitHub Issues][issues-bug-url] 报告Bug。
* 在 [GitHub][issues-feat-url] 请求新的功能。
* 为 [受欢迎的 Feature request][feat-req-vote-url] 投票。

## 贡献你的代码

我们欢迎你加入 NexT 的开发，贡献出你的一份力量。请看[开源贡献指南][contributing-document-url]。 🤗

你也可以随时向我们的[官方插件][official-plugins-url]提交 Issue 或 Pull Request。

## 贡献者

[![][contributors-image]][contributors-url]

## 鸣谢

<p align="center">
  «NexT» 特别感谢这些支持我们核心基础设施的优质服务：
<br>
<br>
  <a href="https://github.com"><img align="center" width="100" src="https://github.githubassets.com/images/modules/logos_page/GitHub-Logo.png"></a>
  &nbsp;&nbsp;&nbsp;
  <a href="https://www.netlify.com"><img align="center" width="150" src="https://cdn.netlify.com/15ecf59b59c9d04b88097c6b5d2c7e8a7d1302d0/1b6d6/img/press/logos/full-logo-light.svg"></a>
<br>
  <sub>GitHub 容许我们托管 Git 仓库，Netlify 容许我们分发文档。</sub>
<br>
<br>
  <a href="https://crowdin.com"><img align="center" width="180" src="https://support.crowdin.com/assets/logos/crowdin-logo1-small.png"></a>
<br>
  <sub>Crowdin 容许我们方便地翻译文档。</sub>
<br>
<br>
  <a href="https://codacy.com"><img align="center" width="155" src="https://user-images.githubusercontent.com/16944225/55026017-623f8f00-5002-11e9-88bf-0d6a5884c6c2.png"></a>
  &nbsp;&nbsp;&nbsp;
  <a href="https://travis-ci.com"><img align="center" width="140" src="https://raw.githubusercontent.com/travis-ci/travis-web/master/public/images/logos/TravisCI-Full-Color.png"></a>
<br>
  <sub>Codacy 容许我们监控代码质量，Travis CI 容许我们运行测试套件。</sub>
</p>

[docs-installation-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/zh-CN/INSTALLATION.md
[docs-data-files-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/zh-CN/DATA-FILES.md
[docs-update-5-1-x-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/zh-CN/UPDATE-FROM-5.1.X.md

[t-news-url]: https://t.me/theme_next_news
[t-chat-url]: https://t.me/theme_next_chinese
[gitter-url]: https://gitter.im/theme-next
[riot-url]: https://riot.im/app/#/room/#theme-next:matrix.org
[i18n-url]: https://i18n.theme-next.org

[awesome-next-url]: https://github.com/theme-next/awesome-next
[issues-bug-url]: https://github.com/theme-next/hexo-theme-next/issues/new?assignees=&labels=Bug&template=bug-report.md
[issues-feat-url]: https://github.com/theme-next/hexo-theme-next/issues/new?assignees=&labels=Feature+Request&template=feature-request.md
[feat-req-vote-url]: https://github.com/theme-next/hexo-theme-next/issues?q=is%3Aopen+is%3Aissue+label%3A%22Feature+Request%22

[contributing-document-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/zh-CN/CONTRIBUTING.md
[official-plugins-url]: https://github.com/theme-next
[contributors-image]: https://opencollective.com/theme-next/contributors.svg?width=890
[contributors-url]: https://github.com/theme-next/hexo-theme-next/graphs/contributors
