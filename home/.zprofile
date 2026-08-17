export EDITOR="nvim"
export VISUAL="nvim"

# launch hyperland
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
	exec start-hyprland
fi
