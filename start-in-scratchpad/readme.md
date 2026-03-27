# start-in-scratchpad

`start-in-scratchpad` starts (or re-focuses) an application in Hyprland’s special scratchpad workspace with an exact size and position.

- If a window matching the given app id/title already exists, it toggles the scratchpad workspace (bringing it forward).
- If no matching window exists, it dispatches an `exec` with float + exact `move` + exact `size`.

## Usage

```bash
start-in-scratchpad <app_id> <title> <move_x> <move_y> <width> <height> <command...>
```

`app_id` and `title` are matched against both class/initialClass and title/initialTitle.

## Key bind example
```
bind = $mod, T, exec, scratchpad-ttyper
```

## Dependencies

- `hyprctl` (Hyprland)
- `jq` (used to parse `hyprctl clients -j`)