#!/usr/bin/env bash
set -euo pipefail

SSH_TARGET="gd@metorex.org"
DOC_ROOT="/var/www/metorex.org"

echo "==> Building the site"
blogin build --force

echo "==> Syncing public/ to $DOC_ROOT"
rsync -az --delete public/ "$SSH_TARGET:$DOC_ROOT/"

echo "==> Deployed"
