#!/bin/bash
SCRIPT_QQ="export PATH=$PATH; $RELPATH/plugins/qq/script.sh"
SCRIPT_CLICK_QQ="export PATH=$PATH; open -a QQ"

qq=(
  drawing=off
  script="$SCRIPT_QQ"
  click_script="$SCRIPT_CLICK_QQ"
  icon=󰘅
  icon.color=$IRIS_MOON
  icon.font="$FONT:Regular:14.0"
  icon.padding_left=0
  icon.padding_right=0
  label="0"
  label.font="$FONT:Semibold:10.0"
  label.padding_left=$INNER_PADDINGS
  label.padding_right=0
  padding_left=$INNER_PADDINGS
  padding_right=$(($INNER_PADDINGS / 2))
  update_freq=10
  updates=when_shown
)

sketchybar --add item moremenu.qq right \
  --set moremenu.qq "${qq[@]}" \
  --subscribe moremenu.qq more-menu-update
