INFO="$(nmcli -t device wifi list | grep \*)"
BAR="$(echo "$INFO" | cut -d ":" -f 13)"
SSID="$(echo "$INFO" | cut -d ":" -f 8)"
WF="$SSID $BAR"
