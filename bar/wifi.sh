#!/bin/bash

# Stephen Cochrane <git@skippy404.com>
# GNU GPLv3

wifi () {
	INFO="$(nmcli -t device wifi list | grep \*)"
	BAR="$(echo "$INFO" | cut -d ":" -f 13)"
	SSID="$(echo "$INFO" | cut -d ":" -f 8)"
	WF="$SSID $BAR"
	if [[ $WF != "" ]]
	then
		printf "%s$WF%s" "$SEP1" "$SEP2"
	fi
}

wifi
