# auto start wayland
[ "$(tty)" = "/dev/tty1" ] && exec Hyprland

# auto startx
#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#  exec startx
#fi
