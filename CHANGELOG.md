# Change Log
All notable changes to this project will be documented in this file (focus on change done on pixL-master branch).

## [pixL-master] - 2024-mm-dd - v2023.08.2
- new features:
	- active support for gpu and igpu amd vulkan api

- updates:
	- llvm 15.0.3 -> 17.0.6
	- qt6 6.4.3 -> 6.6.1
	- sdl2 2.28.1 -> 2.28.5
	- vulkan headers 1.3.257 -> 1.3.270
	- fmt 10.0.0 -> 10.1.1

- fixes:
	- fix dolphin-triforce build since qt6.6.1 update
	- fix qt6-for-emulators
	- fix qt5-qmake-for-prgasus
	- fix add host-libcurl for mangohud & cemu
	- fix glm: dbuild_shared_libs=on
	- fix vulkan-headers depends
	- fix qt5-webengine-chromium
	- fix skeleton
	- fix usbmount
	- fix skeleton-init
	- fix sdl_sound for sdl2
	- fix mosquitto customize S50mosquitto to S29mosquitto
	- fix initscripts customize rck and rcs fir init.d launch
	- fix dhcpcd change S41 to S10 for network share
	- fix dropbear
	- fix bluez5_utils
	- fix binutils add strings on binutils_tools
	- fix nodejs patch v8-qemu-wrapper and mk

## [master] - 2023.08.2, released October 15th, 2023
- Check all change in file -> CHANGES
