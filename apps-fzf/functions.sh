# List installed pacman packages and flatpak applications and open them in fzf
function apps {
  {
    pacman -Qq | sed 's/^/pacman|/'
    flatpak list --app --columns=application 2>/dev/null | sed 's/^/flatpak|/'
  } | fzf \
    --delimiter='|' \
    --with-nth=2 \
    --layout=reverse \
    --preview 'case {1} in pacman) pacman -Qil {2};; flatpak) flatpak info {2};; esac' \
    --bind 'enter:execute[case {1} in pacman) pacman -Qil {2} | less;; flatpak) flatpak info {2} | less;; esac]'
}
