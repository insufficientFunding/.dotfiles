#!/usr/bin/env sh

ScrDir=`dirname "$(realpath "$0")"`
source $ScrDir/globalcontrol.sh
roconf="~/.config/rofi/config.rasi"


# rofi action

case $1 in
    d)  r_mode="drun" ;; 
    w)  r_mode="window" ;;
    f)  r_mode="filebrowser" ;;
    p)  r_mode="power-menu" ;;
    h)  echo -e "rofilaunch.sh [action]\nwhere action,"
        echo "d :  drun mode"
        echo "w :  window mode"
        echo "f :  filebrowser mode,"
        exit 0 ;;
    *)  r_mode="drun" ;;
esac

# if r_mode is power-menu, then 
if [ $r_mode = "power-menu" ]; then
  rofi -show power-menu -modi power-menu:rofi-power-menu -config "~/.config/rofi/powermenu.rasi" -no-symbols
  exit 0
fi


# read hypr theme border

# wind_border=$(( hypr_border * 3 ))
# elem_border=`[ $hypr_border -eq 0 ] && echo "10" || echo $(( hypr_border * 2 ))`
# r_override="window {border: ${hypr_width}px; border-radius: ${wind_border}px;} element {border-radius: ${elem_border}px;}"


# read hypr font size

#fnt_override=`gsettings get org.gnome.desktop.interface font-name | awk '{gsub(/'\''/,""); print $NF}'`
#fnt_override="configuration {font: \"JetBrainsMono Nerd Font ${fnt_override}\";}"


# read hypr theme icon

# icon_override=`gsettings get org.gnome.desktop.interface icon-theme | sed "s/'//g"`
# icon_override="configuration {icon-theme: \"${icon_override}\";}"


# launch rofi

rofi -show $r_mode -config "${roconf}"

