#!/usr/bin/env zsh

zscroll -l 20 \
  --delay 0.3 \
  --update-check true \
  -p "   |   " \
  --match-command "playerctl status 2>/dev/null" \
  --match-text "Playing" "--scroll 1" \
  --match-text "Paused" "--scroll 0" \
  "playerctl metadata --format '{{title}} - {{artist}}' 2>/dev/null || echo 'No media playing'"
