#!/bin/bash

menu() {
  local prompt="$1"
  local options="$2"
  echo -e "$options" | omarchy-launch-walker --dmenu --width 295 --minheight 1 --maxheight 630 -p "$prompt…" 2>/dev/null
}

case $(menu "System" "󰌾  Lock\n󰒲  Suspend\n󰜉  Restart\n󰐥  Shutdown") in
  *Lock*) omarchy-lock-screen ;;
  *Suspend*) systemctl suspend ;;
  *Restart*) omarchy-cmd-reboot ;;
  *Shutdown*) omarchy-cmd-shutdown ;;
esac
