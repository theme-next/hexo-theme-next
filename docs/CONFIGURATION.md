<h1 align="center">Configuration Files</h1>

How to configure Hexo and NexT? The traditional approach is to store some options in site's `/_config.yml` and other options in theme's `/themes/next/_config.yml`. This approach is applicable, but has some drawbacks:
1. Configurations are splitted into two pieces
2. Users may be confused which place should be for options

Currently, it is not smooth to update NexT theme from pulling or downloading new releases. It is quite often running into conflict status when updating NexT theme via `git pull`, or need to merge configurations manually when upgrading to new releases. For the new version of Hexo, the theme can be installed through npm; it is also difficult to directly modify the theme configuration file in `node_modules`.

In order to resolve this issue, NexT provides the following solutions.

<h2 align="center">Option 1: Hexo-Way</h2>

### `theme_config`

With this way, all your configurations locate in main Hexo config file (`/_config.yml`), you don't need to touch `/themes/next/_config.yml` or create any new files. But you must preserve double spaces indents within `theme_config` option.

If there are any new options in new releases, you just need to copy those options from `/themes/next/_config.yml`, paste into `/_config.yml` and set their values to whatever you want.

#### Usage

1. Please ensure you are using Hexo 4.3 (or above).
2. Please confirm that the `/source/_data/next.yml` file does not exist (delete it if exists).
3. Copy needed NexT theme options from theme's `/themes/next/_config.yml` into `/_config.yml`, then\
   2.1. Move all this settings to the right with two spaces (in Visual Studio Code: select all strings, <kbd>CTRL</kbd> + <kbd>]</kbd>).\
   2.2. Add `theme_config:` parameter above all this settings.

### `_config.[name].yml`

With this way, all your configurations locate in config file `/_config.[name].yml`. Replace `[name]` with the value of `theme` option in Hexo config file (`/_config.yml`), e.g. `next` or `hexo-theme-next`.

If there are any new options in new releases, you just need to copy those options from `/themes/next/_config.yml`, paste into this config file and set their values to whatever you want.

#### Usage

1. Please ensure you are using Hexo 4.3 (or above).
2. Please confirm that the `/source/_data/next.yml` file does not exist (delete it if exists).
3. Create a config file in site's root directory, e.g. `_config.next.yml` or `_config.hexo-theme-next.yml`
4. Copy needed NexT theme options from theme's `/themes/next/_config.yml` into `/_config.yml`

### Useful links

* [Hexo Configuration](https://hexo.io/docs/configuration.html)
* [Hexo Pull #757](https://github.com/hexojs/hexo/pull/757)
* [Hexo Pull #4120](https://github.com/hexojs/hexo/pull/4120)

<h2 align="center">Option 2: NexT-Way (Not recommended)</h2>

With this way, you can put all your configurations into one place (`/source/_data/next.yml`), you don't need to touch `/themes/next/_config.yml`.
But option may not accurately procces all hexo external libraries with their additional options (for example, `hexo-server` module options may be readed only in default hexo config).

If there are any new options in new releases, you just need to copy those options from `/themes/next/_config.yml`, paste into `/source/_data/next.yml` and set their values to whatever you want.

This method relies on Hexo [Data files](https://hexo.io/docs/data-files.html). Because Data files is introduced in Hexo 3, so you need upgrade Hexo to 3.0 (or above) to use this feature.

### Usage

1. Please ensure you are using Hexo 3 (or above).
2. Create a file named `next.yml` in site's `/source/_data` directory (create `_data` directory if it does not exist).

<p align="center">And after that steps there are <b>2 variants</b>, need to <b>choose only one</b> of them and <b>resume next steps</b>.</p>

* **Variant 1: `override: false` (default)**:

  1. Check your `override` option in default NexT config, it must set on `false`.\
     In `next.yml` it must not be defined or set on `false` too.
  2. Copy needed options from both site's `/_config.yml` and theme's `/themes/next/_config.yml` into `/source/_data/next.yml`.

* **Variant 2: `override: true`**:

  1. In `next.yml` set `override` option on `true`.
  2. Copy **all** NexT theme options from theme's `/themes/next/_config.yml` into `/source/_data/next.yml`.

3. Then, in main site's `/_config.yml` need to define `theme: next` option (and if needed, `source_dir: source`).
4. Use standard parameters to start server, generate or deploy (`hexo clean && hexo g -d && hexo s`).

### Useful links

* [NexT Issue #328](https://github.com/iissnan/hexo-theme-next/issues/328)
