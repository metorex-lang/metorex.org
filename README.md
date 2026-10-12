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
  *-check.md       draft pages that check the theme, phone width, copy button, and search in a browser
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

`phone-width-check` frames the home page and the theme sample at 320px and records each page width, which should equal the frame width. `theme-toggle-check` clicks the toggle, reloads, clears storage, and records the mode, background, and token colors at each step. `copy-button-check` records the text each copy button copies (`data-copied`), and `search-check` records the result titles for a query (`data-search-results`). Add `--blink-settings=preferredColorScheme=0` for an OS in dark mode, or `1` for light. A normal `blogin build` removes the draft pages from `public/`.

## Logo

The SVG files in `art/` are the sources. Everything else is exported from them.

```
art/logo-mark.svg      the mark: a ruby falling as a meteor, 1024x1024
art/logo.svg           the mark beside the "Metorex" wordmark, with Space Grotesk embedded
art/favicon.svg        the mark's gem with six facets, for 48px and smaller
art/logo-mark.png      the mark cropped to its artwork, 848x1024
art/logo.png           the logo at 2x, 2080x600
art/github-avatar.png  the mark on the dark background, 1024x1024
static/favicon.svg     a copy of art/favicon.svg
static/favicon.ico     art/favicon.svg at 16, 32, and 48px
static/apple-touch-icon.png  the mark on the dark background, 180x180
```

`rsvg-convert` renders `logo-mark.svg` and `favicon.svg`. It does not load the font embedded in `logo.svg`, so export that one with Chrome:

```sh
rsvg-convert -w 2048 -h 2048 art/logo-mark.svg -o mark-2048.png
magick mark-2048.png -channel A -fuzz 4% -trim +repage +channel mark-trim.png
magick mark-trim.png -resize 1024x1024 -depth 8 -strip art/logo-mark.png
magick mark-trim.png -resize 960x960 mark-960.png
magick -size 1024x1024 xc:'#0e0c0b' mark-960.png -gravity center -composite -depth 8 -strip art/github-avatar.png
magick mark-trim.png -resize 160x160 mark-160.png
magick -size 180x180 xc:'#0e0c0b' mark-160.png -gravity center -composite -depth 8 -strip static/apple-touch-icon.png
for size in 16 32 48; do rsvg-convert -w $size -h $size art/favicon.svg -o favicon-$size.png; done
magick favicon-16.png favicon-32.png favicon-48.png static/favicon.ico
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless=new --hide-scrollbars --default-background-color=00000000 --force-device-scale-factor=2 --window-size=1040,300 --screenshot=logo-2x.png "file://$PWD/art/logo.svg"
magick logo-2x.png -depth 8 -strip art/logo.png
```
