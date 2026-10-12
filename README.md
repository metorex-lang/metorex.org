# metorex.org

Public for the [Metorex](https://github.com/metorex-lang/metorex) programming language.

## Local development

Preview with rebuilds on change:

```sh
blogin serve
```

## Layout

```
blogin.json        site config: title, base-url, clean-urls, search, robots, minify, fingerprint
content/
  index.md         the home page, rendered to /
layouts/
  base.haml        the page shell
  home.haml        the home page markup
public/            build output (gitignored)
deploy.sh          build and rsync to the server
```
