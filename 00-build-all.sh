#!/bin/bash
# Run every chapter-8 package script in order. Run inside the chroot.
# Resume: completed packages are marked in ./.done/ and skipped on re-run.
#   - re-running after a failure continues from the failed package
#   - START=NN forces a starting point, e.g.  START=04 ./00-build-all.sh
#   - rm -rf .done   to force a full rebuild from scratch
set -e
cd "$(dirname "$0")"
mkdir -p .done
START="${START:-00}"
for s in [0-9][0-9]-*.sh; do
  [ "$s" = "00-build-all.sh" ] && continue   # do not run ourselves
  num=${s%%-*}
  [ "$num" \< "$START" ] && continue        # honor START=NN
  if [ -f ".done/$s" ]; then
    echo "-- skip $s (already done)"; continue
  fi
  echo "=========================================================="
  echo ">> $s"
  echo "=========================================================="
  bash "./$s"
  touch ".done/$s"                           # mark complete
done
echo "All chapter 8 package scripts completed."
