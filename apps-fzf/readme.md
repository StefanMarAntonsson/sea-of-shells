# apps (pacman + Flatpak in fzf)

The `apps` function lists installed pacman packages and Flatpak applications, lets you pick one in [fzf](https://github.com/junegunn/fzf), and shows package details in the preview. Press Enter to open the full details in `less`.

## Requirements

- `pacman`
- `fzf`
- `less`
- `flatpak` (optional; Flatpak lines are omitted if the command is missing or errors)

## Install

Copy or symlink `functions.sh` somewhere you source from your shell, for example:

`~/.config/bash/functions`

Then source it from `~/.bashrc`:

```bash
[[ -f ~/.config/bash/functions ]] && source ~/.config/bash/functions
```

Reload:

```bash
source ~/.bashrc
```

## Usage

```bash
apps
```

Use the fzf preview while browsing; press Enter to page through full `pacman -Qil` or `flatpak info` output in `less`.
