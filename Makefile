DIR=$(shell pwd)

all: clean
	@# Setup start file
	-@echo "Creating start script for dwm"
	-@echo "#!/bin/bash" > sdwm.sh
	-@echo "exec compton &" >> sdwm.sh
	-@echo "exec feh --bg-scale $(DIR)/assets/alita.png &" >> sdwm.sh
	-@echo "exec dwm" >> sdwm.sh
	-@chmod +x sdwm.sh

build:
	sudo make install -C src/

clean:
	rm -f sdwm.sh
