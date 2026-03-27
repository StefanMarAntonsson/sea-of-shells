# Steam to Active Workspace (Hyprland)

Moves the currently running Steam client window to your active Hyprland
workspace (if it exists), then opens Steam’s library.

## What it does
- Detects the active workspace ID.
- Finds the first mapped Hyprland client whose class is `steam`.
- If found:
  - Moves that window to the active workspace.
  - Focuses the window.
- Launches Steam with `steam://open/library` in the background.

## Requirements
- `hyprctl`
- `jq`
- `steam` installed and available in your PATH
- Steam window class should match `steam`

## Usage
Run the script directly:
```bash
./steam-to-workspace.sh
```

## Key bind example
```
bind = $mod, S, exec, steam-to-workspace
```