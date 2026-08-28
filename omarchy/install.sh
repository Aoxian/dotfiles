#!/bin/bash
# Apply this repo's preferences to the current machine: dotfiles -> live.
# Backs up any existing file before overwriting (mirrors `omarchy refresh`).
# Safe to re-run.
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

INSTALL_REVIEW="${INSTALL_REVIEW:-no}" # set to "yes" to also install packages/review.txt

echo "==> Installing core packages"
mapfile -t core < <(grep -v '^#\|^$' packages/core.txt)
((${#core[@]})) && omarchy pkg add "${core[@]}"

if [[ $INSTALL_REVIEW == yes ]]; then
  echo "==> Installing review packages (INSTALL_REVIEW=yes)"
  mapfile -t review < <(grep -v '^#\|^$' packages/review.txt)
  ((${#review[@]})) && omarchy pkg add "${review[@]}"
else
  echo "==> Skipping packages/review.txt (set INSTALL_REVIEW=yes to include it)"
fi

echo "==> Removing packages dropped from the Omarchy defaults"
mapfile -t remove < <(grep -v '^#\|^$' packages/remove.txt)
((${#remove[@]})) && omarchy pkg drop "${remove[@]}"

echo "==> Setting system font"
omarchy font set "FiraCode Nerd Font Mono"

echo "==> Applying config (dotfiles -> live)"
while IFS= read -r path; do
  src="config/$path"
  dest="$HOME/.config/$path"
  mkdir -p "$(dirname "$dest")"
  if [[ -f $dest ]] && ! cmp -s "$src" "$dest"; then
    backup="$dest.bak.$(date +%s)"
    cp -f "$dest" "$backup"
    echo "  $path (backed up previous version to $(basename "$backup"))"
  else
    echo "  $path"
  fi
  cp -f "$src" "$dest"
done < <(grep -v '^#\|^$' config/paths.txt)

echo "==> Done. Run 'omarchy restart shell' / 'hyprctl reload' if changes need to take effect now."
