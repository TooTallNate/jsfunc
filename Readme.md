# jsfunc

Write JavaScript functions - use as shell functions!

**Note:** `jsfunc` requires a shell that supports [Here
Documents](http://tldp.org/LDP/abs/html/here-docs.html). `bash` is recommended.

## Example

```bash
#!/bin/bash
. "$(which import)"

import tootallnate/jsfunc@2.0.0

# Define a shell function named `str_func`, written in JavaScript
jsfunc str_func <<EOF
  const stdin = String(await process.stdin);
  return (stdin + ' ' + process.argv[2]).toUpperCase();
EOF

# Invoke it the same as any other shell function
printf hello | str_func world
# HELLO WORLD
```
