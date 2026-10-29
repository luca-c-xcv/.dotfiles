#!/usr/bin/env bash
# Show the default microphone volume using WirePlumber's wpctl.
if ! command -v wpctl >/dev/null 2>&1; then
  printf '{"text":"Mic: n/a","tooltip":"wpctl not found"}\\n'
  exit 0
fi
status="$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ 2>/dev/null)"
if [[ -z "$status" ]]; then
  printf '{"text":"Mic: n/a","tooltip":"No default microphone found"}\\n'
  exit 0
fi
volume="$(awk '{printf "%d", $2 * 100}' <<< "$status")"
if grep -q '\\[MUTED\\]' <<< "$status"; then
  printf '{"text":"Mic muted","class":"muted","tooltip":"Default microphone is muted"}\\n'
else
  printf '{"text":"Mic %s%%","tooltip":"Default microphone volume: %s%%\\nClick to open audio controls"}\\n' "$volume" "$volume"
fi
