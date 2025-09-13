#!/bin/bash
export RELPATH=$(dirname $0)/../..
source $RELPATH/colors.sh

# 检测QQ是否运行并获取状态标签
if lsappinfo -all list | grep -E "(QQ|qq)" >>/dev/null; then
  # QQ正在运行，获取状态标签（通常是未读消息数）
  LABEL=$(lsappinfo -all list | grep -E "(QQ|qq)" | egrep -o "\"StatusLabel\"=\{ \"label\"=\"?(.*?)\"? \}" | sed 's/\"StatusLabel\"={ \"label\"=\(.*\) }/\1/g')
  
  if [[ $LABEL =~ ^\".*\"$ ]]; then
    LABEL=$(echo $LABEL | sed 's/^"//' | sed 's/"$//')
    if [ -z "$LABEL" ]; then
      LABEL=0
    fi
  else
    LABEL=0
  fi
  
  # 根据是否有未读消息设置图标颜色
  if [ "$LABEL" != "0" ] && [ "$LABEL" != "" ]; then
    ICON_COLOR=$LOVE_MOON  # 有消息时红色
  else
    ICON_COLOR=$IRIS_MOON  # 无消息时紫色
  fi
else
  # QQ未运行
  LABEL="?"
  ICON_COLOR=$SUBTLE_MOON  # 未运行时灰色
fi

sketchybar --set $NAME label="$LABEL" icon.color=$ICON_COLOR
