#!/usr/bin/env bash
# Uso: ./build.sh [sideload|play]
#   sideload (padrão) -> APK assinado, com atualização interna: ~/projects/Cola_Eleitoral_Ramos_v<versao>.apk
#   play              -> AAB assinado, sem permissão de instalar pacotes: ~/projects/Cola_Eleitoral_Ramos_v<versao>_play.aab
set -euo pipefail
CANAL="${1:-sideload}"
SRC="$(cd "$(dirname "$0")" && pwd)"
APP="$HOME/colinha-app"
export ANDROID_HOME="${ANDROID_HOME:-$HOME/android-sdk}"
VERSAO="$(grep -oP 'versionName "\K[^"]+' "$APP/android/app/build.gradle")"

# copia a fonte para o projeto Capacitor carimbando a data da build
sed "s/__BUILD_DATE__/$(date +%d\\/%m\\/%Y)/" "$SRC/index.html" > "$APP/www/index.html"
(cd "$APP" && npx cap sync android)

case "$CANAL" in
  sideload)
    (cd "$APP/android" && ./gradlew clean assembleSideloadRelease)
    SAIDA="$APP/android/app/build/outputs/apk/sideload/release/app-sideload-release.apk"
    DEST="$HOME/projects/Cola_Eleitoral_Ramos_v${VERSAO}.apk"
    unzip -p "$SAIDA" assets/public/index.html | cmp - "$APP/www/index.html"   # confere que o APK tem a fonte atual
    ;;
  play)
    (cd "$APP/android" && ./gradlew clean bundlePlayRelease)
    SAIDA="$APP/android/app/build/outputs/bundle/playRelease/app-play-release.aab"
    DEST="$HOME/projects/Cola_Eleitoral_Ramos_v${VERSAO}_play.aab"
    ;;
  *) echo "Canal inválido: $CANAL (use sideload ou play)"; exit 1 ;;
esac

cp "$SAIDA" "$DEST"
cp "$SRC/index.html" "$HOME/projects/cola_eleitoral_ramos.html"
echo "OK: $DEST"
