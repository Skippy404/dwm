# dwm
My dwm fork from suckless dwm

## Dependencies
### Build Dependencies
Without these dependences, you cannot build the project, and so these are "hard"
dependences, they are,

* X11 Header files
* Make/GNU Make
* C compiler

### Necessary Dependencies
These dependencies are needed during runtime, or else things will get wacky,
The wacky scale goes from 0 (not wacky) to 10 (Giga wacky).
|Dependency|Wacky Scale|
|----------|-----------|
|[feh](https://feh.finalrewind.org/)|10|
|[compton](https://github.com/chjj/compton)|10|

### Optional Dependencies
My dwm fork can be run without these dependences installed, and so these are "soft"
dependencies, but if you install them, extra features become availiable.

|Dependency|Bar Feature|
|----------|-------|
|acpi|Battery Information|
|nmcli|Display WiFi Information|
|[Herbe](https://github.com/skiqqy/herbe)|Displays a warning when your battery gets low|

## Installing
Simply type,
````
$ make
````
You will be prompted for sudo when it is needed

## Usage
Once installed, when logging in, you will be able to select dwm from your login
manager.

## Bar

![Bar](assets/bar.png)

* First block  -> Current song.
* Second block -> Next appointment in your calander (uses calcurse).
* Third block  -> Date.
* Fourth block -> Wifi status.
* Fifth block  -> Battery status (++ means charging, -- means discharging).

## Desktop

![Desktop](assets/dwm.png)
![Desktop2](assets/dwm2.png)
![Desktop2](assets/dwm3.png)
