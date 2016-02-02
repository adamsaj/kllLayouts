# kllLayouts
This Repo holds the KLL layout files for my personal keyboards.

Each keyboard folder contains a compile.bash script
This script should be enough to clone or update the kiibohd/controller firmware and compile provided it is on a machine that is properly configured to compile the controller firmware.
The compile script also copies the compiled firmware from the controller source folder into the kllLayouts/keyboard folder for convenience.

The other files contained are obviously the kll files as well as a modified keyboard.bash script that is taken from and used by the controller firmware to perform the actual compile.
You will also find a sed file whose purpose should become clear in the "Adding New Layers" Section

#Adding New Layers
Each KLL file should include the keyboard name at the beginning of the filename.
This allows the compile script to copy the KLL file to the correct directory in the controller source code befor compilation.

In order to better manage the layers indexing, every layer should be called using the tag \<layername.number\> where layername is the name of the layer.
This must be done in two places: First in the keyboard.bash file under the additional layers section each layer should be defined like:

PartialMaps[\<layername.number\>]="layername"

Second, each layer should be called from other layers with:

\<trigger\> : U"Function\<layername.number\>";

Finally, a line needs to be added to the sed file that will replace the \<layername.number\> tags with actual numbers.
This line takes the form 's/\<layername.number\>/###/g' where ### is some unused number.

As an example, the numpad layer for the ErgoDox Infinity should be contained in a file called mdergoNumpad.kll.
It should be included in the ergodox.bash script with PartialMaps[\<mdergoNumpad.number\>]="mdergoNumpad".
It should be activated in other layers with U"Function\<mdergoNumpad.number\>"; (substitute Lock or Latch for Function as appropriate)
Lastly, a line must be included in the sed file such as s/\<mdergoNumpad.number\>/4/g.
