Waybar config with speaker volume, microphone status, and power menu

Install:
  mkdir -p ~/.config/waybar/scripts
  cp config style.css ~/.config/waybar/
  cp scripts/*.sh ~/.config/waybar/scripts/
  chmod +x ~/.config/waybar/scripts/*.sh

Dependencies:
  sudo apt install wofi pavucontrol wireplumber libnotify-bin

Restart:
  pkill waybar
  waybar &

Notes:
- Speaker volume uses Waybar's pulseaudio module.
- Microphone status uses `wpctl`; clicking either audio module opens pavucontrol.
- Power menu offers Lock, Suspend, Log out, Restart, and Shut down.
- Lock requires `hyprlock`. Restart/shutdown execute immediately after selecting them.
- If `persistent-workspaces` is unsupported by your Waybar version, remove that property.
