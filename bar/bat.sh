#!/bin/bash

# Stephen Cochrane <git@skippy404.com>
# GNU GPLv3

bat () {
	BATT=$(acpi -b | sed 's/.*[charging|unkown], \([0-9]*\)%.*/\1/gi')
	STAT=$(acpi -b | sed 's/.*: \([a-zA-Z]*\),.*/\1/gi')
	[ $STAT = "Charging" ] && STAT="++" || STAT="--"
	BS="$BATT$STAT"
	printf "%s$BS%s" "$SEP1" "$SEP2"
}
bat
