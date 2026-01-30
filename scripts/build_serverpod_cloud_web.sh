#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Default to this project's Serverpod Cloud domains.
SERVER_URL="${SERVER_URL:-https://culturecompass.api.serverpod.space/}"
REPORT_URL="${REPORT_URL:-https://culturecompass.serverpod.space}"

echo "Building web report (webui -> culture_compass_server/web/app)..."
cd "${ROOT_DIR}/webui"
npm install
npm run build

echo "Building Flutter web app (culture_compass_flutter)..."
cd "${ROOT_DIR}/culture_compass_flutter"
flutter pub get
flutter build web --release \
  --base-href /app/ \
  --dart-define=SERVER_URL="${SERVER_URL}" \
  --dart-define=REPORT_URL="${REPORT_URL}"

echo "Copying Flutter build output into culture_compass_server/web/flutter/app..."
DEST_DIR="${ROOT_DIR}/culture_compass_server/web/flutter/app"
rm -rf "${DEST_DIR}"
mkdir -p "${DEST_DIR}"
cp -R "${ROOT_DIR}/culture_compass_flutter/build/web/"* "${DEST_DIR}/"

echo "Done."

