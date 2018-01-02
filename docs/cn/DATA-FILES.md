# 使用 Hexo 数据文件进行主题配置 ([#328](https://github.com/iissnan/hexo-theme-next/issues/328))

目前，通过 pull 或下载新的 release 版本来更新 NexT 主题的体验并不平滑。当用户使用 `git pull` 更新 NexT 主题时经常需要解决冲突问题，而在手动下载 release 版本时也经常需要手动合并配置。

现在来说，NexT 推荐用户存储部分配置在站点的 `_config.yml` 中，而另一部分在主题的 `_config.yml` 中。这一方式固然可用，但也有一些缺点：
1. 配置项被分裂为两部分；
2. 用户难以弄清何处存放配置选项。

为了解决这一问题，NexT 将利用 Hexo 的[数据文件](https://hexo.io/docs/data-files.html)特性。因为数据文件是在 Hexo 3 中被引入，所以你需要更新至 Hexo 3.0 以后的版本来使用这一特性。

如果你仍然希望使用 Hexo 2.x，你依旧可以按老的方式进行配置。NexT 仍然兼容 Hexo 2.x（但可能会出现错误）。

## 带来的好处

使用这一特性，你现在可以将你的全部配置置于同一位置（`source/_data/next.yml`），并且不需要修改 `next/_config.yml`。如果在新的 release 中出现了任何新的选项，那么你只需要从 `next/_config.yml` 中将他们复制到 `source/_data/next.yml` 中并设置它们的值为你想要的选项。

## 如何使用这一特性

1. 请确认你的 Hexo 版本为 3.0 或更高。
2. 在你站点的 `hexo/source/_data` 目录创建一个 `next.yml` 文件（如果 `_data` 目录不存在，请创建之）。
3. 复制你站点的 `_config.yml` 和主题的 `_config.yml` 中的 NexT 配置项到`hexo/source/_data/next.yml`中。
4. 使用 `--config source/_data/next.yml` 参数来启动服务器，生成或部署。\
   例如：`hexo clean --config source/_data/next.yml && hexo g --config source/_data/next.yml`。
