#!/usr/bin/env bash
# This installer copies our prepared pre-commit hook into .git/hooks and makes it executable.
# You only need to run this once per clone.

set -euo pipefail

# Ensure we're at the repo root (contains .git folder)
if [ ! -d ".git" ]; then
  echo "❌ Not a git repository. Run this from the project root after 'git init'."
  exit 1
fi

mkdir -p .git/hooks
cp hooks/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit

echo "✅ Installed pre-commit hook to .git/hooks/pre-commit"