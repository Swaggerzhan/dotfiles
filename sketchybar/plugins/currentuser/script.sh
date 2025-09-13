#!/bin/bash

### Get real name of current user

RealName=$(dscl . -read /Users/$(whoami) | awk '/RealName/ {gsub("RealName: ",""); print}')
sketchybar --set "$NAME" label="$RealName"