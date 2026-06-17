#!/usr/bin/env bash
# One-step publish: commit everything in this notes repo and push.
# GitHub Pages redeploys automatically (~1 min) → https://yaseeny933.github.io/hpl101-notes/
set -e
export PATH="/opt/homebrew/bin:$PATH"
cd "$(dirname "$0")"
MSG="${1:-Update HPL101 study notes}"
git add -A
if git diff --cached --quiet; then echo "nothing to publish"; exit 0; fi
git commit -q -m "$MSG"
git push -q origin main
echo "published → https://yaseeny933.github.io/hpl101-notes/"
