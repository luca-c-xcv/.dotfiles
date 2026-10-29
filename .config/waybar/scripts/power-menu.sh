#!/usr/bin/env bash
set -euo pipefail
choice="$(printf 'Lock\nSuspend\nLog out\nRestart\nShut down\n' | wofi --dmenu --prompt 'Power menu' --width 300 --height 260)" || exit 0
case "$choice" in
  Lock)
    if command -v hyprlock >/dev/null 2>&1; then
      hyprlock
    else
      notify-send "Power menu" "Install hyprlock to enable locking."
    fi
    ;;
  Suspend) systemctl suspend ;;
  "Log out") hyprctl dispatch exit ;;
  Restart) systemctl reboot ;;
  "Shut down") systemctl poweroff ;;
esac
