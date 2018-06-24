#!/bin/bash
source ./jsfunc.sh

jsfunc my_js_func <<EOF
  const stdin = String(await process.stdin);
  return (stdin + ' ' + process.argv[2]).toUpperCase();
EOF

printf hello | my_js_func world
# HELLO WORLD
