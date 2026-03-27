# Waybar Spotify Status

A simple script that shows Spotify info in Waybar using `playerctl` and `jq`.

It can show:
- the current song title
- the artist name
- the current playback time and total track length
- a paused status when Spotify is paused

## Requirements

You need:
- `playerctl`
- `jq`
- `waybar`
- Spotify desktop app

## Script setup

Save the script as:

`~/.config/waybar/scripts/spotify-status.sh`

Then make it executable:

`chmod +x ~/.config/waybar/scripts/spotify-status.sh`


## Waybar config

Add this to your Waybar config:
```json
"custom/spotify": {
  "exec": "~/.config/waybar/scripts/spotify-status.sh",
  "interval": 1,
  "return-type": "json",
  "format": "{}",
  "escape": false
}
```
Put `custom/spotify` in the module you want it in.
This shows it in the right module.
```json
"modules-right": [
  "custom/spotify"
],
```
## What it does

If Spotify is playing, the module shows:
- song title
- artist
- current time and total time
- Spotify label and icon

If Spotify is paused, the module shows:
- `PAUSED`
- `SPOTIFY`

If Spotify is not running, it shows nothing.

## Notes

This script uses Pango markup, so `escape` must be set to `false` in the Waybar config.

The Spotify icon depends on your font supporting ``.

The script returns these Waybar classes:
- `playing`
- `paused`

You can use those in your Waybar CSS if you want different styling for each state.

## Example CSS

#custom-spotify.playing {
  color: #ffffff;
}

#custom-spotify.paused {
  color: #ff0000;
}
