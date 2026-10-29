#!/usr/bin/env bash
# Window switcher for wofi (wofi has no built-in window mode).
# Install to: ~/.config/hypr/scripts/window-switcher.sh
set -euo pipefail

clients="$(hyprctl clients -j | jq -c '[.[] | select(.mapped and .workspace.id > 0)
  | {address, label: "[\(.workspace.name)] \(.class): \(.title)"}]')"

choice="$(jq -r '.[].label' <<< "$clients" \
  | wofi --dmenu --insensitive --prompt 'Windows')" || exit 0
[[ -z "$choice" ]] && exit 0

address="$(jq -r --arg l "$choice" 'first(.[] | select(.label == $l) | .address) // empty' <<< "$clients")"
[[ -n "$address" ]] && hyprctl dispatch focuswindow "address:$address"
