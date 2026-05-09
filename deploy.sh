#!/bin/bash
set -e
MSG=${1:-"Deploy homepage"}
rsync -av index.html prism-agent:/opt/omniping-homepage/
git add index.html
git diff --cached --quiet || git commit -m "$MSG"
git push
