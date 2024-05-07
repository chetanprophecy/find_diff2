#!/bin/ksh

/bin/env sftp $* 2>/dev/null
ret=$?
if [[ ret -eq 1 ]]; then
  exit 0
fi
exit ret
