#!/bin/bash

# Rofi system control hub with Font Awesome icons

choice=$(printf " Volume Up\n Volume Down\n Mute/Unmute\n Brightness Up\n Brightness Down\n Performance\n Balanced\n Power Saver\n Switch Audio Output\n Toggle Bluetooth\n Connect BT Device\n Disconnect BT Device\n Sleep\n Reboot\n Shutdown" | rofi -dmenu -i -p " Settings")

case "$choice" in
  " Volume Up")
    pamixer -i 5
    ;;
  " Volume Down")
    pamixer -d 5
    ;;
  " Mute/Unmute")
    pamixer -t
    ;;
  " Brightness Up")
    brightnessctl set +10%
    ;;
  " Brightness Down")
    brightnessctl set 10%-
    ;;
  " Performance")
    powerprofilesctl set performance
    ;;
  " Balanced")
    powerprofilesctl set balanced
    ;;
  " Power Saver")
    powerprofilesctl set power-saver
    ;;
  " Switch Audio Output")
    pactl set-default-sink "$(pactl list short sinks | awk '{print $2}' | grep -v "$(pactl get-default-sink)" | head -n 1)"
    ;;
  " Toggle Bluetooth")
    rfkill toggle bluetooth
    ;;
  " Connect BT Device")
    # replace with your device MAC address
    bluetoothctl power on
    bluetoothctl connect XX:XX:XX:XX:XX:XX
    ;;
  " Disconnect BT Device")
    # replace with your device MAC address
    bluetoothctl disconnect XX:XX:XX:XX:XX:XX
    ;;
  " Sleep")
    systemctl suspend
    ;;
  " Reboot")
    systemctl reboot
    ;;
  " Shutdown")
    systemctl poweroff
    ;;
esac

