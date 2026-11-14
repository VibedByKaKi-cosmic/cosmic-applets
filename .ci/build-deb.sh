#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

: "${DEB_VERSION:?DEB_VERSION must be set (run .ci/set-version.sh first)}"

ARTIFACT_DIR="${ARTIFACT_DIR:-$ROOT_DIR/artifacts}"
BUILD_ROOT="$(mktemp -d)"

cleanup() {
  rm -rf "$BUILD_ROOT"
}
trap cleanup EXIT

mkdir -p "$ARTIFACT_DIR"
cp -a "$ROOT_DIR/." "$BUILD_ROOT/cosmic-applets"

cd "$BUILD_ROOT/cosmic-applets"

export DEBFULLNAME="${DEBFULLNAME:-COSMIC Applets CI}"
export DEBEMAIL="${DEBEMAIL:-ci@cosmic-applets.local}"

dch --newversion "$DEB_VERSION" \
  --distribution noble \
  --force-distribution \
  "Automated CI build from ${SOURCE_SHA:-${GITHUB_SHA:-local}}" < /dev/null

# -d skips the Build-Depends check. Two entries in debian/control cannot be
# satisfied on noble: debhelper-compat (= 11) and rustc (>= 1.73). The Rust
# toolchain comes from rust-toolchain.toml through rustup instead.
dpkg-buildpackage -us -uc -b -d

shopt -s nullglob
for deb in "$BUILD_ROOT"/*.deb; do
  cp -v "$deb" "$ARTIFACT_DIR/"
done

ls -la "$ARTIFACT_DIR"
