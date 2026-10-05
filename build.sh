#!/usr/bin/env bash
# Gera o APK de release (assinado com ~/.colinha-keystore) e copia para ~/projects/Cola_Eleitoral_Ramos_v<versao>.apk a partir de index.html e copia para ~/projects/Cola_Eleitoral_Ramos.apk
set -euo pipefail
SRC="$(cd "$(dirname "$0")" && pwd)"
APP="$HOME/colinha-app"
export ANDROID_HOME="${ANDROID_HOME:-$HOME/android-sdk}"

cp "$SRC/index.html" "$APP/www/index.html"
(cd "$APP" && npx cap sync android)
(cd "$APP/android" && ./gradlew clean assembleRelease)

APK="$APP/android/app/build/outputs/apk/release/app-release.apk"
unzip -p "$APK" assets/public/index.html | cmp - "$SRC/index.html"   # confere que o APK tem a fonte atual
VERSAO="$(grep -oP 'versionName "\K[^"]+' "$APP/android/app/build.gradle")"
DEST="$HOME/projects/Cola_Eleitoral_Ramos_v${VERSAO}.apk"
cp "$APK" "$DEST"
cp "$SRC/index.html" "$HOME/projects/cola_eleitoral_ramos.html"
echo "OK: $DEST"
