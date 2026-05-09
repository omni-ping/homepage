#!/bin/bash
set -e
MSG=${1:-"Deploy homepage"}
rsync -av --delete --exclude='.git' --exclude='deploy.sh' --exclude='.gitignore' . prism-agent:/opt/omniping-homepage/
git add -A
git diff --cached --quiet || git commit -m "$MSG"
git push
