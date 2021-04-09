# PoBMacOSBuild
Makefile for building [Path of Building](https://github.com/PathOfBuildingCommunity/PathOfBuilding) on MacOS with help of a [pobfrontend](https://github.com/philroberts/pobfrontend) [fork](https://github.com/jhofmeyr/pobfrontend).

Make options:
1. (optional) `make tools` - uses `brew` to install tools / dependecies for `pobfrontend`.
2. `make` - builds everything that isn't already built, removes `pobfe` if it exists and creates a new one
3. `make update` - pulls git submodules and recreates `pobfe`.  Use this to update PoB without rebuilding everything.
4. `make clean` - cleans up all build files
5. `make nuke` - cleans up build files and resets git submodules
There are a few more but they should be fairly self explanatory.

## Getting Started
1. (optional)`make tools` if you need tools installed
2. (optional) `export QT_CONFIG_PATH=path/for/qt/pkgconfig` - this may be required so QT can be found during the pobfrontend build
3. `make`
4. `cd pobfe && ./pobfrontend`

Important: `./pobfrontend` needs to be called from `pobfe` folder, because it looks for lua files in current folder.
