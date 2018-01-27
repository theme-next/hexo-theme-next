<h1 align="center">Algolia Search</h1>


NexT provides search plugin for index your hexo website content. To use this feature, make sure that the version of NexT you are using is after the v5.1.0 release. What you should note here is that only turn on `enable` of `algolia_search` in `next/_config.yml` cannot let you use the algolia search correctly, you need to install corresponding [Hexo Algolia](https://github.com/oncletom/hexo-algolia) plugin to seach your website with Algolia. Follow the steps described below to complete the installation of Algolia search.

1. Register at [Algolia](https://www.algolia.com/), you can log in directly using GitHub or Google Account. Upon Customer’s initial sign-up for an Account, Customer will have a free, fourteen (14) day evaluation period (the “Evaluation Period”) for the Algolia Services commencing on the Effective Date, subject to the limitations on Algolia’s website. After that, Algolia offers a free, branded version for up to 10k records and 100k operations per month.

1. If a tutorial pops up, you can skip it. Go straight to create an `Index` which will be used later.

    ![](http://theme-next.iissnan.com/uploads/algolia/algolia-step-2.png)

1. Algolia requires users to upload their search index data either manually or via provided APIs. Install and configure [Hexo Algolia](https://github.com/oncletom/hexo-algolia) in your Hexo directory. This plugin will index your site and upload selected data to Algolia.

    ```
    cd hexo
    npm install --save hexo-algolia
    ```

1. Go to API Keys and find your credentials. You will need the `Application ID`, the `Search-only API key` and the `Admin API key` in the following sections. the `Admin API key` needd to keep confidential.

    ![          ](http://theme-next.iissnan.com/uploads/algolia/algolia-step-3.png)

1. In the API KEY page, click the `ALL API KEYS` and the `edit` option in the created APIKEY to activate a pop-up box where you can setup authorizations and restrictions with a great level of precision. Check `Add records`, `Delete records`, `List indices`, `Delete index` features in ACL permissions that will be allowed for the given API key. And then click the Update button.

1. In your site's `_config.yml`, add the following configuration and replace the `applicationID` & `apiKey` & `indexName` with corresponding fields obtained at Algolia:

    ```yml
    algolia:
      applicationID: 'Application ID'
      apiKey: 'Search-only API key'
      indexName: 'indexName'
      chunkSize: 5000
    ```

1. Then run the following command to upload index data, keep a weather eye out the output of the command.

    ```
    $ export(windows 为 set) HEXO_ALGOLIA_INDEXING_KEY=Search-Only API key
    $ hexo clean
    $ hexo algolia
    ```

    ![](http://theme-next.iissnan.com/uploads/algolia/algolia-step-4.png)

1. In `next/_config.yml`, turn on `enable` of `algolia_search`. You can adjust the text in `labels` according to your needs.

    ```yml
    # Algolia Search
    algolia_search:
      enable: false
      hits:
        per_page: 10
      labels:
        input_placeholder: Search for Posts
        hits_empty: "We didn't find any results for the search: ${query}"
        hits_stats: "${hits} results found in ${time} ms"
    ```

<h2 align="center">Known Issues</h2>

1. The lastest version of the [Hexo-Algolia](https://github.com/oncletom/hexo-algolia) plugin removes the content indexing feature, given Algolia's free account limitation.

1. The [Hexo-Algoliasearch](https://github.com/LouisBarranqueiro/hexo-algoliasearch) plugin provides content indexing functionality, but requires the replacement of keywords in the NEXT theme. The same problem exists with `Record Too Big` for Algolia's free account.
    - Replace all `applicationID` in `source/js/src/algolia-search.js` with `appId`
    - Replace all `applicationID` in `layout/_partials/head/head.swig` with `appId`
