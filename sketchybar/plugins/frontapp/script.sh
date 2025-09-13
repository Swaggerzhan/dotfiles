#!/bin/bash
export RELPATH=$(dirname $0)/../..;
source $RELPATH/icon_map.sh

### Set Name and icon of frontapp to currently used app

if [[ -n "$INFO" ]];then
  sketchybar --set $NAME label="$INFO" icon=$(__icon_map "$INFO"; echo $icon_result)
fi