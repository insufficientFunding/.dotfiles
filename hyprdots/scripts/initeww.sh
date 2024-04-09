#!/usr/bin/bash

cd $HOME/eww/target/release

./eww kill

monitors=$(hyprctl monitors -j | jq '.[] | .id')

for monitor in ${monitors}; do
  ./eww open bar${monitor}
done
