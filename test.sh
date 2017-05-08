#!/usr/bin/env bash

set -u

BOLD=$'\e[1m'
RESET=$'\e[0m'
RED=$'\e[31m'
GREEN=$'\e[32m'
MAGENTA=$'\e[35m'

ROOT="$(realpath -- "$(dirname -- "$0")")"
BUILD="$ROOT/.build"
LANGS=()

setup() {
  echo "$BOLD"
  cat <<LOGO
          メ  天
          ソ  体
          ッ -の-
          ド
LOGO
  echo "$RESET"

  rm -rf "$BUILD"
  mkdir -p "$BUILD"
}

assert-天体のメソッド() {
  diff <(echo 天体のメソッド) "$1"
}

LANGS+=(c++)
run-c++() {
  ${CXX:-g++} -o "$BUILD/c++" "$ROOT/天体.cpp"
  "$BUILD/c++"
}

LANGS+=(d)
run-d() {
  rdmd "$ROOT/天体.d"
}

LANGS+=(go)
run-go() {
  go run "$ROOT/天体.go"
}

LANGS+=(io)
run-io() {
  io "$ROOT/天体.io"
}

LANGS+=(java)
run-java() {
  javac -d "$BUILD" "$ROOT/天体.java"
  java -cp "$BUILD" 天体
}

LANGS+=(javascript)
run-javascript() {
  node "$ROOT/天体.js"
}

LANGS+=(objective-c)
run-objective-c() {
  ${CC:-gcc} -o "$BUILD/objective-c" "$ROOT/天体.m" -framework Foundation
  "$BUILD/objective-c"
}

LANGS+=(php)
run-php() {
  php "$ROOT/天体.php"
}

LANGS+=(perl)
run-perl() {
  perl "$ROOT/天体.pl"
}

LANGS+=(python)
run-python() {
  python3 "$ROOT/天体.py"
}

LANGS+=(ruby)
run-ruby() {
  ruby "$ROOT/天体.rb"
}

LANGS+=(rust)
run-rust() {
  rustc -o "$BUILD/rust" "$ROOT/天体.rs"
  "$BUILD/rust"
}

LANGS+=(swift)
run-swift() {
  swift "$ROOT/天体.swift"
}

setup

for lang in "${LANGS[@]}"; do
  printf "${BOLD}test:$RESET $MAGENTA%15s$RESET" "$lang"
  "run-$lang" 2>"$BUILD/$lang.stderr" >"$BUILD/$lang.stdout"
  [[ $? -ne 0 ]] && echo "  ${RED}error$RESET" && cat "$BUILD/$lang.stderr" && exit 1
  assert-天体のメソッド "$BUILD/$lang.stdout" >"$BUILD/$lang.diff"
  [[ $? -ne 0 ]] && echo "  ${RED}fail$RESET" && cat "$BUILD/$lang.diff" && exit 1
  echo "  ${GREEN}ok$RESET"
done
