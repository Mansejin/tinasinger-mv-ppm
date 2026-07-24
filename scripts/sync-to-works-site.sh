#!/usr/bin/env bash
# Sync this PPM deck (+ callsheet) into a local works-site checkout.
# Usage: ./scripts/sync-to-works-site.sh /path/to/works-site
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEST_ROOT="${1:-}"
if [[ -z "$DEST_ROOT" || ! -d "$DEST_ROOT" ]]; then
  echo "Usage: $0 /path/to/works-site" >&2
  exit 1
fi
DEST="$DEST_ROOT/project/tinasinger/mv/ppm"
mkdir -p "$DEST/callsheet" "$DEST/css" "$DEST/data" "$DEST/js" "$DEST/scripts"
cp "$ROOT/index.html" "$DEST/index.html"
cp "$ROOT/callsheet.html" "$DEST/callsheet.html"
cp "$ROOT/callsheet/index.html" "$DEST/callsheet/index.html"
cp "$ROOT/css/callsheet.css" "$DEST/css/callsheet.css"
cp "$ROOT/css/deck.css" "$DEST/css/deck.css"
cp "$ROOT/data/slides.js" "$DEST/data/slides.js"
cp "$ROOT/js/deck.js" "$DEST/js/deck.js"
cp "$ROOT/scripts/export-slides.mjs" "$DEST/scripts/export-slides.mjs"
# Assets (moodboard + audio) — only if missing or forced
if [[ "${SYNC_ASSETS:-0}" == "1" ]]; then
  mkdir -p "$DEST/assets/moodboard"
  rsync -a "$ROOT/assets/" "$DEST/assets/"
fi
echo "Synced PPM + callsheet → $DEST"
echo "Live URL after merge: https://works.mansejin.com/project/tinasinger/mv/ppm/callsheet/"
