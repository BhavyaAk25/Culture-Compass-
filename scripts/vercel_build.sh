#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FLUTTER_DIR="${ROOT_DIR}/.flutter"

if [ ! -d "${FLUTTER_DIR}" ]; then
  echo "Downloading Flutter SDK (stable)..."
  RELEASES_JSON_URL="https://storage.googleapis.com/flutter_infra_release/releases/releases_linux.json"
  RELEASES_JSON="$(curl -fsSL "${RELEASES_JSON_URL}")"

  if command -v python3 >/dev/null 2>&1; then
    FLUTTER_URL="$(python3 - <<'PY'
import json, sys
data = json.loads(sys.stdin.read())
base = data["base_url"]
stable_hash = data["current_release"]["stable"]
archive = None
for rel in data["releases"]:
    if rel.get("hash") == stable_hash:
        archive = rel.get("archive")
        break
if not archive:
    raise SystemExit("Stable release not found in releases JSON.")
print(f"{base}/{archive}")
PY
<<< "${RELEASES_JSON}")"
  elif command -v node >/dev/null 2>&1; then
    FLUTTER_URL="$(node -e "const fs=require('fs'); const data=JSON.parse(fs.readFileSync(0,'utf8')); const base=data.base_url; const hash=data.current_release.stable; const rel=data.releases.find(r=>r.hash===hash); if(!rel){process.exit(1);} console.log(base + '/' + rel.archive);" <<< "${RELEASES_JSON}")"
  else
    echo "Error: python3 or node is required to parse Flutter releases JSON."
    exit 1
  fi

  echo "Fetching ${FLUTTER_URL}"
  curl -fsSL "${FLUTTER_URL}" -o /tmp/flutter.tar.xz
  rm -rf "${ROOT_DIR}/flutter" "${FLUTTER_DIR}"
  tar -xJf /tmp/flutter.tar.xz -C "${ROOT_DIR}"
  mv "${ROOT_DIR}/flutter" "${FLUTTER_DIR}"
  rm -f /tmp/flutter.tar.xz
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
