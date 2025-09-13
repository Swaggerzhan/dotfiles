#!/bin/bash
export RELPATH=$(dirname $0)/../..;
source $RELPATH/colors.sh

# Check for github token 
if [[ -f ~/.github_token ]]; then
GITHUB_TOKEN="$(cat ~/.github_token)" # Should be a PAT with only notification reading permissions

  # Get all user's notifications
  notifications="$(curl -m 15 -s \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer $GITHUB_TOKEN" \
    https://api.github.com/notifications )"
  
  curlSuccess=$?

  count=$(echo $notifications | jq '. | length')

  item=(
    label="$count"
  )

  ### Set icon + label depending on success and notification number

  if [[ $curlSuccess != 0 ]];then 
    item+=(
      icon=􀋞
      icon.color=$SUBTLE_MOON
      label="--"
    )
  elif [ $count -gt 0 ]; then
    item+=(
      icon=􀝗
      icon.color=$LOVE_MOON
    )
  else 
    item+=(
      icon=􀋚
      icon.color=$PINE_MOON
    )
  fi

  sketchybar --set "$NAME" "${item[@]}"
else

  ### If No github token, hide the menu item
  
  item=(
    width=0
    icon=""
  )
  sketchybar --set "$NAME" "${item[@]}"
fi