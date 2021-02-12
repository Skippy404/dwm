.PHONY: bar
DIR=$(shell pwd)

all: clean build xsesh
	@# Setup start file
	-@ echo "Creating start script for dwm"
	-@ echo "#!/bin/bash" > sdwm.sh
	-@ echo "exec compton &" >> sdwm.sh
	-@ echo "exec feh --bg-scale $(DIR)/assets/alita.png &" >> sdwm.sh
	-@ echo "$(DIR)/dwm_bar.sh &" >> sdwm.sh
	-@ echo "exec lxpolkit &" >> sdwm.sh
	-@ echo "exec xscreensaver &" >> sdwm.sh
	-@ echo "exec clipmenud &" >> sdwm.sh
	-@ echo "exec $(DIR)/misc/batd.sh &" >> sdwm.sh
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

build:
	-@echo "Building dwm, sudo is needed..."
	sudo make install -C src/

clean:
	rm -f sdwm.sh
	rm -f dwm.desktop
	rm -f bar.sh
