#!/usr/bin/env bash
# Renders share.html to assets/images/share.png, the 1200 by 630 image a
# link to the site shows, with headless Chrome. Run from the site root.
set -euo pipefail
CHROME="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"
mkdir -p assets/images
"$CHROME" --headless=new --disable-gpu --hide-scrollbars --window-size=1200,630 \
  --virtual-time-budget=5000 --screenshot="$PWD/assets/images/share.png" \
  "file://$PWD/bin/share_image/share.html" 2>/dev/null
