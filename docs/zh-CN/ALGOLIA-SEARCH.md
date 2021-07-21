<h1 align="center">Algolia 搜索</h1>

NexT 内部提供 Algolia 的搜索功能，要使用此功能请确保所使用的 NexT 版本在 `v5.1.0` 之后。需要注意的是，仅仅将 `next/_config.yml` 中 `algolia_search` 的 `enable` 打开**并不能让你使用 Algolia 搜索**，你还需要**使用对应的 Hexo-Algolia 插件** 才能真正在博客页面中使用 Algolia 搜索。按照下面介绍的步骤操作即可完成 Algolia 搜索的安装。

1. 前往 [Algolia 注册页面](https://www.algolia.com/)，注册一个新账户。 可以使用 GitHub 或者 Google 账户直接登录，注册后的 14 天内拥有所有功能（包括收费类别的）。之后若未续费会自动降级为免费账户，免费账户 总共有 10,000 条记录，每月有 100,000 的可以操作数。注册完成后，创建一个新的 Index，这个 Index 将在后面使用。

    ![](https://user-images.githubusercontent.com/16272760/73673892-68a29b00-46ea-11ea-90c5-916b4b11fc7a.png)

1. 在 `API Keys` 页面找到需要使用的一些配置的值，包括 `Application ID` 和 `Search-Only API Key`。注意，`Admin API Key` 需要保密保存，不要外泄。

    ![](https://user-images.githubusercontent.com/16272760/73673895-693b3180-46ea-11ea-8f50-8bae850b50d0.png)

1. 编辑 `站点配置文件`，新增以下配置，除了 `chunkSize` 字段，替换成在 Algolia 获取到的值：

    ```yml
    algolia:
      applicationID: 'Application ID'
      apiKey: 'Search-Only API Key'
      indexName: 'indexName'
      chunkSize: 5000
    ```

1. 在 `API Keys` 页面，点击 `All API Keys` 切换到对应的页面中。接着点击 `New API Key` 按钮，来**编辑权限**。在弹出框中找到 ACL ，**输入 addObject、 deleteObject、listIndexes、deleteIndex 权限**，然后点击最下方的 `Create` 按钮。将这个新创建的 API Key 复制到剪贴板，我们称之为 `High-privilege API key`。

    ![](https://user-images.githubusercontent.com/16272760/73673902-6b04f500-46ea-11ea-9c80-4e5c5002e07b.png)
    ![](https://user-images.githubusercontent.com/16272760/73673905-6b9d8b80-46ea-11ea-9e01-702ec2a8a297.png)

1. 在 Index 和 API Key 创建完成后，此时这个 Index 里未包含任何数据。接下来需要安装 [Hexo Algolia](https://github.com/oncletom/hexo-algolia) 扩展，这个扩展的功能是搜集站点的内容并通过 API 发送给 Algolia。前往站点根目录，执行命令安装：

    ```
    $ cd hexo
    $ npm install hexo-algolia
    ```

1. 当配置完成，在站点根目录下执行以下命令来更新上传 Index。请注意观察命令的输出。

    ```
    $ export HEXO_ALGOLIA_INDEXING_KEY=High-privilege API key # 使用 Git Bash
    # set HEXO_ALGOLIA_INDEXING_KEY=High-privilege API key # 使用 Windows CMD 命令行
    $ hexo clean
    $ hexo algolia
    ```

    ![](http://theme-next.iissnan.com/uploads/algolia/algolia-step-4.png)

1. 更改`主题配置文件`，找到 Algolia Search 配置部分，将 `enable` 改为 `true`。同时你需要**关闭**其他搜索插件，如 Local Search 等。你也可以根据需要调整 `labels` 中的文本：

    ```yml
    # Algolia Search
    algolia_search:
      enable: true
      hits:
        per_page: 10
      labels:
        input_placeholder: Search for Posts
        hits_empty: "We didn't find any results for the search: ${query}"
        hits_stats: "${hits} results found in ${time} ms"
    ```

1. 如果你需要通过 CDN 使用其它版本的 algolia-instant-search ，请根据以下步骤操作。

    你需要在`主题配置文件`中的 vendors 字段进行设置：

    ```yml
    vendors:
      ...
      # Algolia Search
      # algolia_search: //cdn.jsdelivr.net/npm/algoliasearch@4/dist/algoliasearch-lite.umd.js
      # instant_search: //cdn.jsdelivr.net/npm/instantsearch.js@4/dist/instantsearch.production.min.js
      algolia_search: //cdn.jsdelivr.net/npm/algoliasearch@4/dist/algoliasearch-lite.umd.js
      instant_search: //cdn.jsdelivr.net/npm/instantsearch.js@4/dist/instantsearch.production.min.js
      ...
    ```

<h2 align="center">已知的问题</h2>

1. 考虑到 Algolia 免费账户的限制，目前 [Hexo-Algolia](https://github.com/oncletom/hexo-algolia) 插件最新版本去掉了正文索引功能。
1. [Hexo-Algoliasearch](https://github.com/LouisBarranqueiro/hexo-algoliasearch) 插件提供了正文索引功能，不过需要替换 NEXT 主题中的关键字。对于免费账户，`Record Too Big` 的问题同样存在。
    - 替换 `source/js/algolia-search.js` 中所有的 `applicationID` 为 `appId`
    - 替换 `layout/_partials/head/head.swig` 中所有的 `applicationID` 为 `appId`
