#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$PROJECT_DIR"
: "${CAPTURE_URL:?Set CAPTURE_URL to the exact preview URL}"
: "${CAPTURE_DIR:?Set CAPTURE_DIR for screenshot output}"
RUNTIME_DIR="${RUNTIME_DIR:-/home/runner/work/_temp/omgithub-runtime}"
export CAPTURE_URL CAPTURE_DIR RUNTIME_DIR
export CAPTURE_READY_SELECTOR="${CAPTURE_READY_SELECTOR:-[data-capture-ready=\"true\"]}"
export CAPTURE_STRICT="${CAPTURE_STRICT:-1}"

/usr/bin/time -p mkdir -p "$CAPTURE_DIR"
/usr/bin/time -p node "$RUNTIME_DIR/scripts/default-capture.mjs"
