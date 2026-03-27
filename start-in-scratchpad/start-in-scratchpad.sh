#!/bin/bash

set -u

APP_ID=${1-}
TITLE=${2-}
MOVE_X=${3-}
MOVE_Y=${4-}
WIDTH=${5-}
HEIGHT=${6-}
shift 6 || true

if [[ -z "${APP_ID}" || -z "${TITLE}" || -z "${MOVE_X}" || -z "${MOVE_Y}" || -z "${WIDTH}" || -z "${HEIGHT}" || $# -eq 0 ]]; then
    echo "Usage: $0 <app_id> <title> <move_x> <move_y> <width> <height> <command...>" >&2
    exit 1
fi

RULES="workspace special:scratchpad; float; move exact ${MOVE_X} ${MOVE_Y}; size exact ${WIDTH} ${HEIGHT}"

WINDOW_ADDR=$(
    hyprctl clients -j 2>/dev/null | jq -r \
        --arg app "$APP_ID" \
        --arg title "$TITLE" '
            .[]
            | select(
                .class == $app
                or .initialClass == $app
                or .title == $title
                or .initialTitle == $title
            )
            | .address
        ' 2>/dev/null | head -n1
)

if [[ -z "${WINDOW_ADDR}" ]]; then
    CMD=$(printf '%q ' "$@")
    hyprctl dispatch exec "[$RULES] $CMD"
else
    hyprctl dispatch togglespecialworkspace scratchpad
fi