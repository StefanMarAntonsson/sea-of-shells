#!/bin/bash

APP_ID="org.seaofshells.scratchpad.ttyper"
TITLE="TTyper"

start-in-scratchpad \
    "$APP_ID" \
    "$TITLE" \
    1320 \
    1500 \
    1200 \
    600 \
    uwsm-app -- xdg-terminal-exec --app-id="$APP_ID" --title="$TITLE" \
    -e bash -lc 'exec ttyper'