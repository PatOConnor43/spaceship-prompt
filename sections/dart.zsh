#
# Go
#
# Go is an open source programming language that makes it easy
# to build efficient software.
# Link: https://golang.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_DART_SHOW="${SPACESHIP_DART_SHOW=true}"
SPACESHIP_DART_PREFIX="${SPACESHIP_DART_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_DART_SUFFIX="${SPACESHIP_DART_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_DART_SYMBOL="${SPACESHIP_DART_SYMBOL="🎯 "}"
SPACESHIP_DART_COLOR="${SPACESHIP_DART_COLOR="cyan"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_dart() {
  [[ $SPACESHIP_DART_SHOW == false ]] && return

  # If there are Dart-specific files in current directory
  [[ -f pubspec.yaml ]] || return

  spaceship::exists dart || return

  # Go version is either the commit hash and date like "devel +5efe9a8f11 Web Jan 9 07:21:16 2019 +0000"
  # at the time of the build or a release tag like "go1.11.4".
  # https://github.com/denysdovhan/spaceship-prompt/issues/610
  local dart_version=$(dart --version 2>&1 | sed -nre 's/^[^0-9]*(([0-9]+\.)*[0-9]+).*/\1/p')

  spaceship::section \
    "$SPACESHIP_DART_COLOR" \
    "$SPACESHIP_DART_PREFIX" \
    "${SPACESHIP_DART_SYMBOL}${dart_version}" \
    "$SPACESHIP_DART_SUFFIX"
}
