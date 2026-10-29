#!/usr/bin/env bash
# Hyprland startup script - minimal Android 16 theme

# Set wallpaper with swaybg (no GPU needed, works in VMs)
swaybg -m fill -i ~/.config/hypr/wallpapers/dark_minimal.png &

# Start waybar (status bar)
waybar &

# Start notification daemon
swaync &

# Optional: Set cursor to a more minimal style
# gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita' 2>/dev/null
# gsettings set org.gnome.desktop.interface cursor-size 24 2>/dev/null

# Ensure keyboard layout is set correctly
setxkbmap us

echo "Hyprland minimal theme loaded successfully!"
