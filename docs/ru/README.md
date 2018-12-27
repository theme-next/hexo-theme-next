<div align="right">Язык: <a title="Английский" href="../../README.md">:us:</a>
<a title="Китайский" href="../../docs/zh-CN/README.md">:cn:</a>
:ru:</div>

# <div align="center"><a title="Перейти на сайт" href="https://theme-next.org"><img align="center" width="56" height="56" src="https://raw.githubusercontent.com/theme-next/hexo-theme-next/master/source/images/logo.svg?sanitize=true"></a> e x T</div>

<p align="center">«NexT» — элегантная высококачественная тема под <a href="http://hexo.io">Hexo</a>. Сделана с нуля, с любовью.</p>

<p align="center">
  <a href="https://www.codacy.com/app/theme-next/hexo-theme-next?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=theme-next/hexo-theme-next&amp;utm_campaign=Badge_Grade"><img src="https://api.codacy.com/project/badge/Grade/72f7fe7609c2438a92069f448e5a341a" title="Оценка проекта"></a>
  <a href="https://travis-ci.org/theme-next/hexo-theme-next?branch=master"><img src="https://travis-ci.org/theme-next/hexo-theme-next.svg?branch=master" title="Travis CI [Linux]"></a>
  <a href="https://crwd.in/theme-next"><img src="https://d322cqt584bo4o.cloudfront.net/theme-next/localized.svg" title="Добавить или улучшить перевод за несколько секунд!"></a>
  <a href="https://github.com/theme-next/hexo-theme-next/issues"><img src="http://isitmaintained.com/badge/open/theme-next/hexo-theme-next.svg" title="Процент нерешённых проблем"></a>
  <a href="https://github.com/theme-next/hexo-theme-next/issues"><img src="http://isitmaintained.com/badge/resolution/theme-next/hexo-theme-next.svg" title="Среднее время решения проблемы"></a>
  <a href="https://github.com/theme-next/hexo-theme-next/releases"><img src="https://badge.fury.io/gh/theme-next%2Fhexo-theme-next.svg"></a>
  <a href="http://hexo.io"><img src="https://img.shields.io/badge/hexo-%3E%3D%203.5.0-blue.svg"></a>
  <a href="https://github.com/theme-next/hexo-theme-next/blob/master/LICENSE.md"><img src="https://img.shields.io/badge/license-%20AGPL-blue.svg"></a>
</p>

## Демо

* :heart_decoration: Muse тема: [LEAFERx](https://leaferx.online) | [Alex LEE](http://saili.science) | [Miaia](https://11.tt)
* :six_pointed_star: Mist тема: [Jeff](https://blog.zzbd.org) | [uchuhimo](http://uchuhimo.me) | [xirong](http://www.ixirong.com)
* :pisces: Pisces тема: [Vi](http://notes.iissnan.com) | [Acris](https://acris.me) | [Jiaxi He](http://jiaxi.io)
* :gemini: Gemini тема: [Ivan.Nginx](https://almostover.ru) | [Raincal](https://raincal.com) | [Dandy](https://dandyxu.me)

Больше примеров «NexT» [здесь](https://github.com/iissnan/hexo-theme-next/issues/119).

## Установка

Простейший вариант установки — склонировать весь репозиторий:

   ```sh
   $ cd hexo
   $ git clone https://github.com/theme-next/hexo-theme-next themes/next
   ```

Или предлагаю почитать [детальные инструкции по установке][docs-installation-url], если вариант выше не устраивает.

## Плагины

В конфиге NexT'а теперь можно найти зависимости на каждый модуль, который был вынесен во внешние репозитории, которые могут быть найдены по [ссылке основной организации](https://github.com/theme-next).

Например, Вы хотите использовать `fancybox` для своего сайта. Открываем конфиг NexT'а и находим:

```yml
# Fancybox
# Dependencies: https://github.com/theme-next/theme-next-fancybox
fancybox: false
```

Затем включаем параметр `fancybox` и переходим по ссылке «Dependencies» с дальнейшеми инструкциями по установке этого модуля.

## Обновление

Можно обновить до последней мастер-ветки следующей командой:

```sh
$ cd themes/next
$ git pull
```

А если всплывают ошибки во время обновления (что-то наподобии **«Commit your changes or stash them before you can merge»**), рекомендуется ознакомиться с особенностью хранения [дата-файлов в Hexo][docs-data-files-url].\
Как бы то ни было, можно обойти ошибки при обновлении если «Закомитить», «Стэшнуть» или «Откатить» локальные изменения. Смотрим  [здесь](https://stackoverflow.com/a/15745424/5861495) как это сделать.

**Если нужно обновиться с версии v5.1.x на v6.0.x, читаем [здесь][docs-update-5-1-x-url].**

## Известные баги

Для тех, кто столкнулся с ошибкой **«[Error: Cannot find module 'hexo-util'](https://github.com/iissnan/hexo-theme-next/issues/1490)»**, следует проверить версию NPM.

* `> 3`: Всё равно не работает? Удалите директорию `node_modules` и переустановите с помощью `npm install`.
* `< 3`: Добавьте `hexo-util` принудительно командой `npm install --save-dev hexo-util` к основным пакетам с Hexo.

## Содействие

Приветсвуется любое содействие, не стесняйтесь сообщать «Баги», брать «Форки» и вливать «Пулы».

## Обратная связь

* Задать вопрос на [Stack Overflow][stack-url].
* Запросить новую возможность на [GitHub][contributing-url].
* Голосовать за [популярные запросы возможностей][feat-req-vote-url].
* Сообщить об ошибке в разделе [GitHub Issues][issues-url].
* Вступить в наши [Gitter][gitter-url] / [Riot][riot-url] / [Telegram][t-chat-url] чаты.
* Подписаться на новости через [канал Telegram'а][t-news-url].

## Сторонние приложения

* :triangular_flag_on_post: <a title="Маркдаун Редактор под Hexo" href="https://github.com/zhuzhuyule/HexoEditor" target="_blank">HexoEditor</a>

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

[docs-installation-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/ru/INSTALLATION.md
[docs-data-files-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/ru/DATA-FILES.md
[docs-update-5-1-x-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/ru/UPDATE-FROM-5.1.X.md
