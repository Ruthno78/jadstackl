#!/bin/bash
# V95 — Senkronize sèlman moso PWOP LOKAL yo (ajan.html + assets/lang/
# manifest/favicon) soti nan public/ ale nan android/app/src/main/assets/public/,
# pou WebViewAssetLoader ka sèvi yo anndan APK la san rekonekte sou entènèt.
# Itilize pa .github/workflows/android-build.yml — ka lanse lokalman tou:
#   ./scripts/sync-android-assets.sh
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$ROOT_DIR/public"
DEST="$ROOT_DIR/android/app/src/main/assets/public"

if [ ! -f "$SRC/ajan.html" ]; then
  echo "ERROR: $SRC/ajan.html pa jwenn — verifye w ap lanse script la nan rasin repo a." >&2
  exit 1
fi

rm -rf "$DEST"
mkdir -p "$DEST"

cp "$SRC/ajan.html" "$DEST/"
cp -r "$SRC/assets" "$DEST/"
[ -d "$SRC/lang" ] && cp -r "$SRC/lang" "$DEST/"
[ -f "$SRC/manifest.webmanifest" ] && cp "$SRC/manifest.webmanifest" "$DEST/"
[ -f "$SRC/favicon.svg" ] && cp "$SRC/favicon.svg" "$DEST/"
[ -f "$SRC/favicon.ico" ] && cp "$SRC/favicon.ico" "$DEST/"

echo "OK — senkronize soti nan public/ rive nan android/app/src/main/assets/public/"
find "$DEST" -maxdepth 2 -type f | sort
