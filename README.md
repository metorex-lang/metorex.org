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
  *-check.md       draft pages that check the theme, copy button, and search in a browser
  docs/            the reference manual
  theme-sample.md  draft page with one code block per highlighted token class
layouts/
  base.haml        the page shell, with the script that applies the stored theme before first paint
  _header.haml     wordmark, primary navigation, search, and the light/dark toggle
  _footer.haml     license and GitHub links
  home.haml        the home page markup
  page.haml        a plain page: title and body
  404.haml         the not-found page
  docs/            show.haml for a manual page, index.haml for /docs, _docnav.haml for the sidebar
assets/
  css/style.css    color tokens, fonts, and site styles
  js/theme.js      the light/dark toggle
  js/nav.js        the menu button on narrow screens
  js/copy.js       the copy button on code blocks. In a block with $, >>, or .. prompts it copies the prompted lines without the prompts
  js/highlight.js  highlighting for metorex and ruby code blocks
static/fonts/      Inter, Space Grotesk, and JetBrains Mono, self-hosted
bin/
  check-theme.raku hex colors only in the token block, and WCAG AA contrast in both modes
public/            build output (gitignored)
deploy.sh          build and rsync to the server
```

## Checking the theme and layouts

```sh
raku bin/check-theme.raku
```

The draft pages build only with `blogin build --drafts`. Each writes its results to `data-` attributes on its `<html>` element, which headless Chrome prints with `--dump-dom`:

```sh
blogin build --drafts --force
python3 -m http.server 8731 -b 127.0.0.1 -d public
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless=new --virtual-time-budget=5000 --dump-dom http://127.0.0.1:8731/theme-toggle-check.html | grep -o 'data-results="[^"]*"'
```

`phone-width-check` frames the sample page at 320px and records its page width, which should equal the frame width. `theme-toggle-check` clicks the toggle, reloads, clears storage, and records the mode, background, and token colors at each step. `copy-button-check` records the text each copy button copies (`data-copied`), and `search-check` records the result titles for a query (`data-search-results`). Add `--blink-settings=preferredColorScheme=0` for an OS in dark mode, or `1` for light. A normal `blogin build` removes the draft pages from `public/`.
