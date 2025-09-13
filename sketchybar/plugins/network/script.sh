#!/bin/sh

INTERFACES="en0 en7"
INTERVAL=1

# 获取所有可用接口的初始数据 (只统计<Link#xx>行)
read -r INITIAL_IN INITIAL_OUT <<<"$(netstat -ib | awk -v ifaces="$INTERFACES" '
  BEGIN { split(ifaces, iface_list, " ") }
  {
    for (i in iface_list) {
      if ($1 == iface_list[i] && $3 ~ /^<Link#/ && $7 ~ /^[0-9]+$/ && $10 ~ /^[0-9]+$/) {
        bytes_in+=$7; bytes_out+=$10
      }
    }
  }
  END { print bytes_in, bytes_out }
')"

sleep $INTERVAL

# 获取所有可用接口的最终数据 (只统计<Link#xx>行)
read -r FINAL_IN FINAL_OUT <<<"$(netstat -ib | awk -v ifaces="$INTERFACES" '
  BEGIN { split(ifaces, iface_list, " ") }
  {
    for (i in iface_list) {
      if ($1 == iface_list[i] && $3 ~ /^<Link#/ && $7 ~ /^[0-9]+$/ && $10 ~ /^[0-9]+$/) {
        bytes_in+=$7; bytes_out+=$10
      }
    }
  }
  END { print bytes_in, bytes_out }
')"

# 计算字节/秒，然后转换为MB/s
DOWN_BYTES_PER_SEC=$(( (FINAL_IN - INITIAL_IN) / INTERVAL ))
UP_BYTES_PER_SEC=$(( (FINAL_OUT - INITIAL_OUT) / INTERVAL ))

# 格式化输出MB/s (固定宽度)
format_speed() {
  local BYTES_PER_SEC=$1
  awk -v bytes="$BYTES_PER_SEC" 'BEGIN {
    speed = bytes / 1000000
    printf "%6.2fMB/s", speed
  }'
}

DOWN_FORMAT=$(format_speed "$DOWN_BYTES_PER_SEC")
UP_FORMAT=$(format_speed "$UP_BYTES_PER_SEC")


sketchybar --set network.down label="$DOWN_FORMAT" drawing=on \
           --set network.up label="$UP_FORMAT" drawing=on