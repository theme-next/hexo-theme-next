<div align="right">Язык: <a title="Английский" href="../../README.md">:us:</a>
<a title="Китайский" href="../../docs/zh-CN/README.md">:cn:</a>
:ru:</div>

# <div align="center"><a title="Перейти на сайт" href="https://theme-next.org"><img align="center" width="56" height="56" src="https://raw.githubusercontent.com/theme-next/hexo-theme-next/master/source/images/logo.svg?sanitize=true"></a> e x T</div>

<p align="center">«NexT» — элегантная высококачественная тема под <a href="http://hexo.io">Hexo</a>. Сделана с нуля, с любовью.</p>

[![gitter-image]][gitter-url]
[![riot-image]][riot-url]
[![t-chat-image]][t-chat-url]
[![t-news-image]][t-news-url]
[![lang-image]][lang-url]
[![travis-image]][travis-url]
[![rel-image]][releases-url]
[![hexo-image]][hexo-url]
[![lic-image]][lic-url]

## Демо

* :heart_decoration: Muse тема: [LEAFERx](https://leaferx.online) | [XiaMo](https://notes.wanghao.work) | [OAwan](https://oawan.me)
* :six_pointed_star: Mist тема: [Jeff](https://blog.zzbd.org) | [uchuhimo](http://uchuhimo.me) | [xirong](http://www.ixirong.com)
* :pisces: Pisces тема: [Vi](http://notes.iissnan.com) | [Acris](https://acris.me) | [Rainy](https://rainylog.com)
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

## Сторонние приложения

* :triangular_flag_on_post: <a title="Маркдаун Редактор под Hexo" href="https://github.com/zhuzhuyule/HexoEditor" target="_blank">HexoEditor</a>

[browser-image]: https://img.shields.io/badge/browser-%20chrome%20%7C%20firefox%20%7C%20opera%20%7C%20safari%20%7C%20ie%20%3E%3D%209-lightgrey.svg
[browser-url]: https://www.browserstack.com

[lang-image]: https://d322cqt584bo4o.cloudfront.net/theme-next/localized.svg "Добавить или улучшить перевод за несколько секунд!"
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

[docs-installation-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/ru/INSTALLATION.md
[docs-data-files-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/ru/DATA-FILES.md
[docs-update-5-1-x-url]: https://github.com/theme-next/hexo-theme-next/blob/master/docs/ru/UPDATE-FROM-5.1.X.md
