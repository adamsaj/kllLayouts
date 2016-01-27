#!/bin/bash

rm -r ICED-*
cd ../..
if [ -d controller ]; then
	cd controller
	git pull
	cd ..
else
	git clone git@github.com:kiibohd/controller
	cd controller
	mkdir first_compile
	cd first_compile
	cmake ..
	make
	cd ../..
fi
cp keyboard_layouts/mdergo/mdergo* controller/kll/layouts
cp keyboard_layouts/mdergo/ergodox.bash controller/Keyboards

cd controller/Keyboards
./ergodox.bash
cd ../..
mv controller/Keyboards/ICED-* keyboard_layouts/mdergo
