#!/usr/bin/env zsh

# Directory to save screenshots
SAVE_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SAVE_DIR"

FILENAME="$SAVE_DIR/screenshot_$(date +'%Y%m%d_%H%M%S').png"

# Select region and capture to both file and clipboard
GEOM=$(slurp)
if [ -n "$GEOM" ]; then
  grim -g "$GEOM" "$FILENAME"
  cat "$FILENAME" | wl-copy
  notify-send "Screenshot Taken" "Saved to $FILENAME and copied to clipboard" -i "$FILENAME"
fi
EOF
