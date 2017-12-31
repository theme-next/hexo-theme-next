# Theme configurations using Hexo data files ([#328](https://github.com/iissnan/hexo-theme-next/issues/328))

Currently, it is not smooth to update NexT theme from pulling or downloading new releases. It is quite often running into conflict status when updating NexT theme via `git pull`, or need to merge configurations manually when upgrading to new releases.

 At present, NexT encourages users to store some options in site's `_config.yml` and other options in theme's `_config.yml`. This approach is applicable, but has some drawbacks:
1. Configurations are splitted into two pieces
2. Users may be confused which place should be for options

In order to resolve this issue, NexT will take advantage of Hexo [Data files](https://hexo.io/docs/data-files.html). Because Data files is introduced in Hexo 3, so you need upgrade Hexo to 3.0 (or above) to use this feature.

If you prefer Hexo 2.x, you can still use the old approach for configurations. NexT is still compatible with Hexo 2.x (but errors are possible).

## Benefits

With this feature, now you can put all your configurations into one place (`source/_data/next.yml`), you don't need to touch `next/_config.yml`. If there are any new options in new releases, you just need to copy those options from `next/_config.yml`, paste into `_data/next.yml` and set their values to whatever you want.

## How to use this feature

1. Please ensure you are using Hexo 3 (or above)
2. Create an file named `next.yml` in site's `hexo/source/_data` directory (create `_data` directory if it did not exist)
3. Copy NexT theme options both in site's `_config.yml` and theme's `_config.yml` into `hexo/source/_data/next.yml`.
4. Use `--config source/_data/next.yml` parameter to start server, generate or deploy.\
   For example: `hexo clean --config source/_data/next.yml && hexo g --config source/_data/next.yml`.
