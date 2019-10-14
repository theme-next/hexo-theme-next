<div align="right">
  Язык:
  <a title="Английский" href="../../README.md">:us:</a>
  <a title="Китайский" href="../zh-CN/README.md">:cn:</a>
  :ru:
</div>

# <div align="center"><a title="Репозиторий сайта NexT" href="https://github.com/theme-next/theme-next.org"><img align="center" width="56" height="56" src="https://raw.githubusercontent.com/theme-next/hexo-theme-next/master/source/images/logo.svg?sanitize=true"></a> e x T</div>

<p align="center">
  «NexT» — элегантная высококачественная тема под <a href="https://hexo.io">Hexo</a>. Сделана с нуля, с любовью.
<br>
<br>
  <a href="https://github.com/theme-next/hexo-theme-next/releases"><img src="https://img.shields.io/github/package-json/v/theme-next/hexo-theme-next?style=flat-square"></a>
  <a href="https://nodejs.org"><img src="https://img.shields.io/badge/node-%3E=8.6.0-green?style=flat-square"></a>
  <a href="https://hexo.io"><img src="https://img.shields.io/badge/hexo-%3E=3.5.0-blue?style=flat-square&logo=hexo"></a>
  <a href="https://github.com/theme-next/hexo-theme-next/blob/master/LICENSE.md"><img src="https://img.shields.io/badge/license-%20AGPL-orange?style=flat-square&logo=gnu"></a>
<br>
  <a href="https://bestpractices.coreinfrastructure.org/projects/2625"><img src="https://img.shields.io/cii/level/2625?style=flat-square" title="Инициатива базовой инфраструктуры: передовой опыт"></a>
  <a href="https://travis-ci.org/theme-next/hexo-theme-next?branch=master"><img src="https://img.shields.io/travis/theme-next/hexo-theme-next/master?style=flat-square&logo=travis%20ci" title="Travis CI [Linux]"></a>
  <a href="https://app.codacy.com/manual/theme-next/hexo-theme-next/dashboard"><img src="https://img.shields.io/codacy/grade/72f7fe7609c2438a92069f448e5a341a/master?style=flat-square&logo=codacy" title="Оценка проекта"></a>
  <img src="https://img.shields.io/snyk/vulnerabilities/github/theme-next/hexo-theme-next?style=flat-square" title="Vulnerabilities">
<br>
  <img src="https://user-images.githubusercontent.com/16272760/63487983-da41b080-c4df-11e9-951c-64883a8a5e9b.png">
</p>

## Демо

<p align="center">
  :heart_decoration: <a href="https://muse.theme-next.org">Muse</a> | :six_pointed_star: <a href="https://mist.theme-next.org">Mist</a> | :pisces: <a href="https://pisces.theme-next.org">Pisces</a> | :gemini: <a href="https://theme-next.org">Gemini</a>
<br>
<br>
  Больше примеров «NexT» <a href="https://github.com/theme-next/awesome-next#live-preview">здесь</a>.
</p>

## Установка

Простейший вариант установки — склонировать весь репозиторий:

```sh
$ cd hexo
$ git clone https://github.com/theme-next/hexo-theme-next themes/next
```

Или предлагаю почитать [детальные инструкции по установке][docs-installation-url], если вариант выше не устраивает.

## Плагины

В конфиге NexT'а теперь можно найти зависимости на каждый модуль, который был вынесен во внешние репозитории, которые могут быть найдены по [ссылке основной организации](https://github.com/theme-next).

Например, Вы хотите использовать `pjax` для своего сайта. Открываем конфиг NexT'а и находим:

```yml
# Easily enable fast Ajax navigation on your website.
# Dependencies: https://github.com/theme-next/theme-next-pjax
pjax: false
```

Затем включаем параметр `pjax` и переходим по ссылке «Dependencies» с дальнейшеми инструкциями по установке этого модуля.

## Обновление

Можно обновить до последней мастер-ветки следующей командой:

```sh
$ cd themes/next
$ git pull
```

А если всплывают ошибки во время обновления (что-то наподобии **«Commit your changes or stash them before you can merge»**), рекомендуется ознакомиться с особенностью хранения [дата-файлов в Hexo][docs-data-files-url].\
Как бы то ни было, можно обойти ошибки при обновлении если «Закомитить», «Стэшнуть» или «Откатить» локальные изменения. Смотрим  [здесь](https://stackoverflow.com/a/15745424/5861495) как это сделать.

**Если нужно обновиться с версии v5.1.x на последней версиями, читаем [здесь][docs-update-5-1-x-url].**

## Обратная связь

* Подписаться на новости через [канал Telegram'а][t-news-url].
* Вступить в наши [Telegram][t-chat-url] / [Gitter][gitter-url] / [Riot][riot-url] чаты.
* [Добавить или улучшить перевод][i18n-url] за несколько секунд.
* Посетите [Awesome NexT][awesome-next-url] список.
* Сообщить об ошибке в разделе [GitHub Issues][issues-bug-url].
* Запросить новую возможность на [GitHub][issues-feat-url].
* Голосовать за [популярные запросы возможностей][feat-req-vote-url].

## Содействие

Приветсвуется любое содействие, не стесняйтесь сообщать «Баги», брать «Форки» и вливать «Пулы».

## Благодарности

<p align="center">
  «NexT» выражает особую благодарность этим замечательным сервисам, которые спонсируют нашу основную инфраструктуру:
<br>
<br>
  <a href="https://github.com"><img align="center" width="100" src="https://github.githubassets.com/images/modules/logos_page/GitHub-Logo.png"></a>
  &nbsp;&nbsp;&nbsp;
  <a href="https://www.netlify.com"><img align="center" width="150" src="https://cdn.netlify.com/15ecf59b59c9d04b88097c6b5d2c7e8a7d1302d0/1b6d6/img/press/logos/full-logo-light.svg"></a>
<br>
  <sub>GitHub позволяет нам хостить Git-репозиторий, Netlify позволяет нам деплоить документацию.</sub>
<br>
<br>
  <a href="https://crowdin.com"><img align="center" width="180" src="https://support.crowdin.com/assets/logos/crowdin-logo1-small.png"></a>
<br>
  <sub>Crowdin позволяет нам удобно переводить документацию.</sub>
<br>
<br>
  <a href="https://codacy.com"><img align="center" width="155" src="https://user-images.githubusercontent.com/16944225/55026017-623f8f00-5002-11e9-88bf-0d6a5884c6c2.png"></a>
  &nbsp;&nbsp;&nbsp;
  <a href="https://www.browserstack.com"><img align="center" width="140" src="https://www.browserstack.com/images/mail/browserstack-logo-footer.png"></a>
<br>
  <sub>Codacy позволяет нам запускать набор тестов, BrowserStack позволяет нам тестировать в реальных браузерах.</sub>
</p>

[docs-installation-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/ru/INSTALLATION.md
[docs-data-files-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/ru/DATA-FILES.md
[docs-update-5-1-x-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/ru/UPDATE-FROM-5.1.X.md

[t-news-url]: https://t.me/theme_next_news
[t-chat-url]: https://t.me/theme_next
[gitter-url]: https://gitter.im/theme-next
[riot-url]: https://riot.im/app/#/room/#theme-next:matrix.org
[i18n-url]: https://i18n.theme-next.org

[awesome-next-url]: https://github.com/theme-next/awesome-next
[issues-bug-url]: https://github.com/theme-next/hexo-theme-next/issues/new?assignees=&labels=Bug&template=bug-report.md
[issues-feat-url]: https://github.com/theme-next/hexo-theme-next/issues/new?assignees=&labels=Feature+Request&template=feature-request.md
[feat-req-vote-url]: https://github.com/theme-next/hexo-theme-next/issues?q=is%3Aopen+is%3Aissue+label%3A%22Feature+Request%22+sort%3Areactions-%2B1-desc
