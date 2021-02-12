#!/bin/bash
show_warning=1
batfile="BAT0"
main=$(basename $0)

[ $(command -v herbe) ] && dep=1 || echo "Herbe missing"

batd () {
	while [ ! -z $dep ]
	do
		level=$(cat /sys/class/power_supply/$batfile/capacity)
		if [ $level -lt 15 ] && [ $show_warning -eq 1 ]
		then
			show_warning=0
			herbe "[WARNING] Battery Low!"
		elif [ $level -gt 16 ]
		then
			show_warning=1
		fi
		sleep 15
	done
}

# Start batd if the script is called. This is so that te script can be sourced
# without starting batd
if [ "$main" = "batd.sh" ]
then
	batd
fi
