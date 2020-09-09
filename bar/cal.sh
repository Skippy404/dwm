#!/bin/bash

# Stephen Cochrane <git@skippy404.com>
# GNU GPLv3

cal () {
	next=$(calcurse -n | cut -d$'\n' -f 2 | sed -e 's/^[ ]*//')
	if [[ $next != "" ]]
	then
		printf "%sNext -> $next%s\n" "$SEP1" "$SEP2"
	fi
}

cal
