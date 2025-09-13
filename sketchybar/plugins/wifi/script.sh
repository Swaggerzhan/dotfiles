#!/bin/bash
export RELPATH=$(dirname $0)/../..;
source $RELPATH/colors.sh

ICON_HOTSPOT=􀉤
ICON_WIFI=􀙇
ICON_WIFI_ERROR=􀙥
ICON_WIFI_OFF=􀙈

getname() {
  # 获取en0接口的IP地址
  EN0_IP=$(ifconfig en0 | awk '/inet / {print $2}')
  PUBLIC_IP=$(curl -m 2 https://ipinfo.io 2>/dev/null 1>&2; echo $?)

  ### Set icon according to wifi state

  if [[ $EN0_IP != "" ]]; then
    ICON=$ICON_WIFI
    ICON_COLOR=$PINE_MOON
    LABEL="$EN0_IP"
  else
    ICON=$ICON_WIFI_OFF
    ICON_COLOR=$LOVE_MOON
    LABEL="off"
  fi

  ### If no access to internet change icon color

  if [[ $PUBLIC_IP != "0" && $LABEL != "off" ]];then
    ICON=$ICON_WIFI_ERROR
    ICON_COLOR=$SUBTLE_MOON
  fi
  


  wifi=(
    icon=$ICON
    label="$LABEL"
    icon.color=$ICON_COLOR
  )

  sketchybar --set $NAME "${wifi[@]}"
}

setscroll() {

  ### For performances, only scroll on hover

  STATE="$(sketchybar --query $NAME | sed 's/\\n//g; s/\\\$//g; s/\\ //g' | jq -r '.geometry.scroll_texts')"

  case "$1" in
    "on") target="off"
    ;;
    "off") target="on"
    ;;
  esac

  if [[ "$STATE" == "$target" ]]; then
    sketchybar --set "$NAME" scroll_texts=$1
  fi

}

case "$SENDER" in
  "mouse.entered") setscroll on 
  ;;
  "mouse.exited") setscroll off
  ;;
  *) getname
  ;;
esac