#!/bin/bash

# Get Volume
get_volume() {
if command -v pamixer &>/dev/null; then
    if [ true == $(pamixer --get-mute) ]; then
        echo "Mute"
        exit
    else
        pamixer --get-volume
    fi
else
    amixer -D pulse sget Master | awk -F '[^0-9]+' '/Left:/{print $3}'
fi
}

# Get icons
get_icon() {
  vol="$(get_volume)"
  current="${vol%%%}"
  status=`amixer get Master | tail -n1 | grep -wo 'on'`

  if [[ "$status" == "on" ]]; then
    if [[ "$current" -eq "0" ]]; then
      echo ""
    elif [[ ("$current" -ge "0") && ("$current" -le "30") ]]; then
      echo ""
    elif [[ ("$current" -ge "30") && ("$current" -le "60") ]]; then
      echo ""
    elif [[ ("$current" -ge "60") && ("$current" -le "100") ]]; then
      echo ""
    fi
  else
    echo ""
  fi
}

# Increase Volume
inc_volume() {
  amixer -Mq set Master,0 5%+ unmute
}

# Decrease Volume
dec_volume() {
  amixer -Mq set Master,0 5%- unmute
}

# Toggle Mute
toggle_mute() {
  status=`amixer get Master | tail -n1 | grep -wo 'on'`

  if [[ "$status" == "on" ]]; then
    amixer set Master toggle
  else
    amixer set Master toggle
  fi
}

# Execute accordingly
if [[ "$1" == "--get" ]]; then
  get_volume
elif [[ "$1" == "--icon" ]]; then
  get_icon
elif [[ "$1" == "--inc" ]]; then
  inc_volume
elif [[ "$1" == "--dec" ]]; then
  dec_volume
elif [[ "$1" == "--toggle" ]]; then
  toggle_mute
else
  get_volume
fi
