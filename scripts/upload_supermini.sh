#!/usr/bin/env bash
set -euo pipefail

# Simple helper to upload the Companion BLE firmware to an ESP32-C3 Super Mini
# Usage: ./scripts/upload_supermini.sh

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PIO="$(command -v pio || true)"
if [ -z "$PIO" ]; then
  echo "PlatformIO CLI not found in PATH. Install it with: pip3 install --user platformio" >&2
  exit 2
fi

# Adjust the port if your device is on a different path
UPLOAD_PORT=${UPLOAD_PORT:-/dev/ttyACM0}

$PIO -d "$PROJECT_DIR" run -e ESP32C3_SuperMini_companion_radio_ble -t upload -v --upload-port "$UPLOAD_PORT"
