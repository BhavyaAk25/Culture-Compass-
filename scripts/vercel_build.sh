#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FLUTTER_DIR="${ROOT_DIR}/.flutter"

if [ ! -d "${FLUTTER_DIR}" ]; then
  git clone https://github.com/flutter/flutter.git -b stable --depth 1 "${FLUTTER_DIR}"
fi

export PATH="${FLUTTER_DIR}/bin:${PATH}"

flutter --version
flutter config --enable-web

cd "${ROOT_DIR}/culture_compass_flutter"
flutter pub get
flutter build web --release \
  --dart-define=SERVER_URL=https://culturecompass.api.serverpod.space/ \
  --dart-define=REPORT_URL=https://culturecompass.serverpod.space

cd "${ROOT_DIR}"
rm -rf vercel_dist
mkdir -p vercel_dist
cp -R culture_compass_flutter/build/web/* vercel_dist/
