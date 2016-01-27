#!/bin/bash

cd ../../controller
git pull
cd ..
cp keyboard_layouts/mdergo/mdergo* controller/kll/layouts
cp keyboard_layouts/mdergo/ergodox.bash controller/Keyboards

cd controller/Keyboards
./ergodox.bash
cd ../..
mv controller/Keyboards/ICED-* keyboard_layouts/mdergo
