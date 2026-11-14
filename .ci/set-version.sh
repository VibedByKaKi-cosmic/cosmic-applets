#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

UPSTREAM_VERSION="$(sed -n 's/^version = "\(.*\)"$/\1/p' cosmic-applets/Cargo.toml | head -n 1)"
: "${UPSTREAM_VERSION:?could not read the version from cosmic-applets/Cargo.toml}"
SOURCE_SHA="$(git rev-parse HEAD)"
SHORT_SHA="${SOURCE_SHA:0:7}"
# Native source format: no Debian revision, so the version is upstream plus a git suffix.
DEB_VERSION="${UPSTREAM_VERSION}+git${SHORT_SHA}"

export UPSTREAM_VERSION DEB_VERSION SHORT_SHA SOURCE_SHA

echo "Package version set to ${DEB_VERSION}"

if [[ -n "${GITHUB_ENV:-}" ]]; then
  {
    echo "UPSTREAM_VERSION=${UPSTREAM_VERSION}"
    echo "DEB_VERSION=${DEB_VERSION}"
    echo "SHORT_SHA=${SHORT_SHA}"
    echo "SOURCE_SHA=${SOURCE_SHA}"
  } >> "$GITHUB_ENV"
fi
