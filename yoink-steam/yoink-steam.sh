#!/usr/bin/env bash

set -euo pipefail

STEAM_CLASS="steam"
STEAM_URI="steam://open/library"

active_workspace="$(hyprctl activeworkspace -j | jq -r '.id')"

steam_client_address="$(
  hyprctl clients -j | jq -r '
    map(select(
      (.class | ascii_downcase) == "'"$STEAM_CLASS"'"
      and (.mapped == true)
    ))[0].address // empty
  '
)"

if [[ -n "${steam_client_address}" ]]; then
  hyprctl dispatch movetoworkspacesilent \
    "${active_workspace},address:${steam_client_address}" >/dev/null 2>&1
  hyprctl dispatch focuswindow \
    "address:${steam_client_address}" >/dev/null 2>&1
fi

steam "${STEAM_URI}" >/dev/null 2>&1 &