#!/bin/bash
jsfunc() {
  local code="$(cat)"
  local fn="$(cat <<EOFF
$1() {
  node <(cat <<EOF
require('stream').Readable.prototype.then = function (...args) {
  return new Promise((res, rej) => {
    const bufs = [];
    this.on('error', rej).on('data', buf => bufs.push(buf))
        .on('end', () => res(Buffer.concat(bufs))); }).then(...args);
};
(async () => {
${code}
})()
  .then(val => {
    const type = typeof val;
    if (type !== 'undefined') {
      console.log(type === 'string' ? val : JSON.stringify(val, null, 2));
    }
  }).catch(err => {
    console.error(err.stack);
    process.exit(1);
  });
EOF
) "\$@"
}
EOFF
)"
  eval "${fn}"
}
