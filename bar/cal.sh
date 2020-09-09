#!/bin/bash

# Stephen Cochrane <git@skippy404.com>
# GNU GPLv3

cal () {
	printf "%s" "$SEP1"
	next=$(calcurse -n | cut -d$'\n' -f 2 | sed -e 's/^[ ]*//')
	printf "Next -> $next%s\n" "$SEP2"
}

cal
