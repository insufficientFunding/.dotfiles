locale=$(hyprctl devices | grep "sonix-xtrfy-k4" -A 3 | grep "active keymap" | cut -f3 -d " " | head -1)

printf "%s" "$locale\n"
