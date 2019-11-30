# PoBMacOSBuild
Makefile for building [Path of Building](https://github.com/Openarl/PathOfBuilding) on MacOS woht help of [pobfrontend](https://github.com/philroberts/pobfrontend).

1. (optional) `make tools` - This will use `brew` to install tools / dependecies for `pobfrontend`
2. `make` - Will install PathOfBuilding in current folder
3. `cd PathOfBuilding`
4. `./pobfrontend` - to run Path of Building

Important: 4 step needs to be called from `PathOfBuilding` folder, because it looks for lua files in current folder.