.PHONY: bar
DIR=$(shell pwd)

all: clean build xsesh bar
	@# Setup start file
	-@ echo "Creating start script for dwm"
	-@ echo "#!/bin/bash" > sdwm.sh
	-@ echo "exec compton &" >> sdwm.sh
	-@ echo "exec feh --bg-scale $(DIR)/assets/alita.png &" >> sdwm.sh
	-@ echo "while true; do" >> sdwm.sh
	-@ echo "xsetroot -name \"\$$($(DIR)/bar.sh)\"" >> sdwm.sh
	-@ echo "sleep 10 " >> sdwm.sh
	-@ echo "done &" >> sdwm.sh
	-@ echo "exec lxpolkit &" >> sdwm.sh
	-@ echo "exec xscreensaver &" >> sdwm.sh
	-@ echo "exec clipmenud &" >> sdwm.sh
	-@ echo "exec dwm" >> sdwm.sh
	-@ chmod +x sdwm.sh

xsesh:
	-@ echo "[Desktop Entry]" > dwm.desktop
	-@ echo "Name=dwm" >> dwm.desktop
	-@ echo "Comment=suckless dynamic window manager" >> dwm.desktop
	-@ echo "Exec=$(DIR)/sdwm.sh" >> dwm.desktop
	-@ echo "TryExec=dwm" >> dwm.desktop
	-@ echo "Type=Application" >> dwm.desktop
	-@ echo "X-LightDM-DesktopName=dwm" >> dwm.desktop
	-@ echo "DesktopNames=dwm" >> dwm.desktop
	-@ echo "Keywords=tiling;wm;suckless;" >> dwm.desktop
	-@ echo "Creating new symlink, sudo is needed..."
	sudo rm -f /usr/share/xsessions/dwm.desktop
	sudo cp $(DIR)/dwm.desktop /usr/share/xsessions/

bar:
	@# Setup vars
	-@ echo "BS=\"\"" > bar.sh
	-@ echo "DT=\"\"" >> bar.sh
	-@ echo "WF=\"\"" >> bar.sh
	@# Append modules
	-@ cat ./bar/bat.sh >> bar.sh
	-@ cat ./bar/date.sh >> bar.sh
	-@ cat ./bar/wifi.sh >> bar.sh
	-@ echo "echo \"\$$DT \$$WF \$$BS\"" >> bar.sh
	-@chmod +x bar.sh

build:
	-@echo "Building dwm, sudo is needed..."
	sudo make install -C src/

clean:
	rm -f sdwm.sh
	rm -f dwm.desktop
	rm -f bar.sh
