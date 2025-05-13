#!/usr/bin/env bash

status=$(cat /sys/class/leds/input3::capslock/brightness)

if [ "$status" -eq 1 ];then
	printf "Caps Lock On"
else
	printf ""
fi