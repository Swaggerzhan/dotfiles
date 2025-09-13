#!/bin/bash

NETWORK_SCRIPT="export PATH=$PATH; $RELPATH/plugins/network/script.sh"

network_down=(
  drawing=off
  icon=􀄩
  icon.color=$FOAM_MOON
  icon.font="$FONT:Bold:13.0"
  y_offset=-7
  label="0.00MB/s"
  label.font="$FONT:Semibold:10.0"
  label.color=$TEXT_MOON
  script="$NETWORK_SCRIPT"
  update_freq=1
  padding_left=5
  padding_right=0
  background.drawing=off
)

network_up=(
  drawing=off
  icon=􀄨
  icon.color=$ROSE_MOON
  icon.font="$FONT:Bold:13.0"
  y_offset=7
  label="0.00MB/s"
  label.font="$FONT:Semibold:10.0"
  label.color=$TEXT_MOON
  script="$NETWORK_SCRIPT"
  update_freq=1
  padding_left=-80
  padding_right=0
  background.drawing=off
)

sketchybar --add item network.down e \
  --set network.down "${network_down[@]}" \
  --add item network.up e \
  --set network.up "${network_up[@]}" \
  --add bracket network_group network.down network.up
