#!/bin/bash
eval "`curl -sfLS import.pw`"
import "import.pw/assert@1.1.0"

source ./jsfunc.sh

jsfunc my_js_func <<EOF
  const stdin = String(await process.stdin);
  return (stdin + ' ' + process.argv[2]).toUpperCase();
EOF

assert.equal "$(printf hello | my_js_func world)" "HELLO WORLD"
