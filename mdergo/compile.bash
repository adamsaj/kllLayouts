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

cd kllLayouts/mdergo
for i in mdergo*; do
	./layermap.sed <$i >../../controller/kll/layouts/$i
done
./layermap.sed <ergodox.bash >../../controller/Keyboards/ergodox.bash
cd ../..

cd controller/Keyboards
./ergodox.bash
cd ../..
mv controller/Keyboards/ICED-* kllLayouts/mdergo
