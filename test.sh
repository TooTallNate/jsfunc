#!/bin/bash
set -euo pipefail
test -f "$HOME/.import.sh" || curl -sfS https://import.pw > "$HOME/.import.sh"
source "$HOME/.import.sh"
import "import.pw/assert@2.1.2"

source ./jsfunc.sh

# Return a String
jsfunc str_func <<EOF
  const stdin = String(await process.stdin);
  return (stdin + ' ' + process.argv[2]).toUpperCase();
EOF
assert_equal "$(printf hello | str_func world)" "HELLO WORLD"

# Return an Object
jsfunc obj_func <<EOF
  return { foo: 'bar' };
EOF
assert_equal "$(obj_func)" '{"foo":"bar"}'
