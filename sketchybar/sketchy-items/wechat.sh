#!/bin/bash
SCRIPT_WECHAT="export PATH=$PATH; $RELPATH/plugins/wechat/script.sh"
SCRIPT_CLICK_WECHAT="export PATH=$PATH; open -a WeChat"

wechat=(
  drawing=off
  script="$SCRIPT_WECHAT"
  click_script="$SCRIPT_CLICK_WECHAT"
  icon=󰘑
  icon.color=$PINE_MOON
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

sketchybar --add item moremenu.wechat right \
  --set moremenu.wechat "${wechat[@]}" \
  --subscribe moremenu.wechat more-menu-update
