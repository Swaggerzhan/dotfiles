#!/bin/bash
# sketchybar --query default_menu_items
menucontrols=(
  #"Control__Center,UserSwitcher"
  "Control__Center,Bluetooth"
)

menuitems=(
  "qq"
  "user"
  "wechat"
)

SCRIPT_CLICK_SEPARATOR_MORE="export PATH=$PATH; \
$RELPATH/plugins/more-menu/script.sh \
\"${menucontrols[@]}\" \"${menuitems[@]}\" $INNER_PADDINGS \"$FONT\" "

separator=(
  icon=􀯶
  label.drawing=off
  icon.font="$FONT:Semibold:14.0"
  #click_script='yabai -m space --create && sketchybar --trigger space_change'
  icon.color=$SUBTLE_MOON
  click_script="$SCRIPT_CLICK_SEPARATOR_MORE"
)

sketchybar --add item separator-more right \
  --set separator-more "${separator[@]}" \
  --add event more-menu-update
