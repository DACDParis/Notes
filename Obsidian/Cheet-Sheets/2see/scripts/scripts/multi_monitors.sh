#!/usr/bin/env bash

# Current Theme
dir="$HOME/.config/rofi/powermenu/type-2"
theme='style-1'

# Options
single_monitor=''
dual_monitor=''
dual_monitor_tv_1080p=''
yes=''
no=''

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "Uptime: $uptime" \
		-mesg "Uptime: $uptime" \
		-theme ${dir}/${theme}.rasi
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${dir}/${theme}.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$single_monitor\n$dual_monitor\n$dual_monitor_tv_1080p" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--single_monitor' ]]; then
      hyprctl setprop monitor=HDMI-A-2,256x1080@60,0x0,1
	  hyprctl monitor=HDMI-A-2,disable
		elif [[ $1 == '--dual_monitor' ]]; then
	  hyprctl monitor=HDMI-A-2,3840x2160@30,0x0,1
      hyprctl monitor=DP-2,2560x1080@60,3840x0,1 default=true
  	    elif [[ $1 == '--dual_monitor_tv_1080p' ]]; then
      hyprctl monitor=DP-2,2560x1080@60,1920x0,1 default=true
      hyprctl monitor=HDMI-A-2,1920x1080@60,0x0,1
		fi
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $single_monitor)
		run_cmd --single_monitor
        ;;
    $dual_monitor)
		run_cmd --dual_monitor
        ;;
    $dual_monitor_tv_1080p)
		run_cmd --dual_monitor_tv_1080p
        ;;
esac




#trash
#		elif [[ "$DESKTOP_SESSION" == 'i3' ]]; then
#				i3-msg exit
#     elif [[ "$DESKTOP_SESSION" == 'hyprland' ]]; then
#        loginctl kill-user $(whoami) 