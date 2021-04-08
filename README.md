# PoBMacOSBuild
Makefile for building [Path of Building](https://github.com/PathOfBuildingCommunity/PathOfBuilding) on MacOS with help of a [pobfrontend](https://github.com/philroberts/pobfrontend) [fork](https://github.com/jhofmeyr/pobfrontend).

Make options:
1. (optional) `make tools` - uses `brew` to install tools / dependecies for `pobfrontend`.
2. (use this one if you need everything)`make setup` - installs tools, pulls submodules (note this removes any local changes), and builds everything.
3. `make` - builds everything that isn't already built, removes `pobfe` if it exists and creates a new one
4. `make update` - pulls git submodules and recreates `pobfe`.  Use this to update PoB without rebuilding everything.
5. `make clean` - cleans up all build files
6. `make nuke` - cleans up build files and resets git submodules
There are a few more but they should be fairly self explanatory.

## Getting Started
1. `make setup` / `make` (depending on whether you need tools installed
2. cd pobfe`
3. `./pobfrontend` - to run Path of Building

Important: 3 step needs to be called from `pobfe` folder, because it looks for lua files in current folder.
