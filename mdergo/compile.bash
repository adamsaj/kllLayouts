#!/bin/bash

if [ -d ICED-R ]; then
	rm -r ICED-*
fi

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
	cd ..
	rm -rf first_compile
	cd ..
fi

cd kllLayouts/mdergo
for i in mdergo*; do
	./layermap.sh <$i >../../controller/kll/layouts/$i
done
./layermap.sh <ergodox.bash >../../controller/Keyboards/ergodox.bash
cd ../..

cd controller/Keyboards
./ergodox.bash
cd ../..
mv controller/Keyboards/ICED-* kllLayouts/mdergo
