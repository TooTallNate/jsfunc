# jsfunc

Write JavaScript functions - use as bash functions!


## Example

```bash
#!/bin/sh
eval "`curl -sfLS import.pw`"

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
