#!/bin/bash
# Sync live config back into this repo: live -> dotfiles.
# Run this after editing ~/.config directly, before committing.
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

changed=0
while IFS= read -r path; do
  src="$HOME/.config/$path"
  dest="config/$path"
  if [[ ! -f $src ]]; then
    echo "  $path - skipped, missing from ~/.config" >&2
    continue
  fi
  if cmp -s "$src" "$dest" 2>/dev/null; then
    continue
  fi
  mkdir -p "$(dirname "$dest")"
  cp -f "$src" "$dest"
  echo "  $path (updated)"
  changed=1
done < <(grep -v '^#\|^$' config/paths.txt)

if [[ $changed -eq 0 ]]; then
  echo "==> Nothing changed."
else
  echo "==> Review with 'git diff' in this repo, then commit."
fi
