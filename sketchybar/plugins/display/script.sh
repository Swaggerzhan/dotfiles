#!/bin/bash
export PATH=/opt/homebrew/bin/:$PATH

### Set all current existong display groups

displaygroups=(
  "Built-in"
  "Built-in + External"
  "Dual External"
)

ICON="􀢹"
if [[ -n "$(pgrep "BetterDisplay")" ]]; then
  for displayGroup in "${displaygroups[@]}"; do
    if [[ "$(betterdisplaycli get --name="$displayGroup" --active)" == "on" ]]; then

      ### Assign icon depending on active display group

      case "$displayGroup" in
      'Built-in')
        ICON="􁈸"
        ;;
      'Built-in + External')
        ICON="􂤓"
        ;;
      'Dual External')
        ICON="􀨧"
        ;;
      esac
    fi
  done
  sketchybar --set $NAME icon="$ICON" drawing="on"
else
  sketchybar --set $NAME drawing="off"
fi
