#!/bin/bash
export RELPATH=$(dirname $0)/../..
command -v 'menubar' 2>/dev/null 1>&2 || alias menubar="$RELPATH/menubar"

### Show menu items depending on the click type

if [[ $BUTTON == "right" ]]; then
  menubar -s "Control Center,Battery"
else
  menubar -s "Battery Toolkit,Item-0"
fi
