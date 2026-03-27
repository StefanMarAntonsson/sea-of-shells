#!/usr/bin/env bash

status=$(playerctl --player=spotify status 2>/dev/null)

if [ -z "$status" ]; then
  exit 0
fi

if [ "$status" = "Paused" ]; then
  jq -nc \
    --arg text \
    '<tt><span foreground="#ff0000" weight="bold">PAUSED</span> <span foreground="#23c55c" weight="bold">SPOTIFY  </span></tt> ' \
    --arg class "paused" \
    '{text: $text, class: $class}'
  exit 0
fi

text=$(
  playerctl --player=spotify metadata \
    --format '<tt><span weight="bold">{{ title }}</span> <span foreground="#a6adc8">{{ artist }}</span> <span foreground="#00ffff">{{ duration(position) }}/{{ duration(mpris:length) }}</span> <span foreground="#23c55c" weight="bold">SPOTIFY  </span></tt> '
)

jq -nc \
  --arg text "$text" \
  --arg class "playing" \
  '{text: $text, class: $class}'