PKG_CONFIG_PATH := $(if $(QT_CONFIG_PATH),$(QT_CONFIG_PATH), $(PKG_CONFIG_PATH))

all: pobfe

.PHONY: update
update: git_pull backup_data pobfe

.PHONY: rebuild_all
rebuild_all: clean_build clean_lcurl pobfe

.PHONY: rebuild_fe
rebuild_fe: clean_build pobfe

.PHONY: backup_data
backup_data:
	cp -r pobfe/Builds .

#### Copy all the bits required for the FE to pobfe
#### This will always execute due to clean_fe dependency

pobfe: clean_fe lcurl.so build
	mkdir pobfe; \
		cp -r ./Builds pobfe;\
		cp build/pobfrontend pobfe; \
		cp pob/manifest.xml pobfe; \
		cp -R pob/runtime pobfe; \
		cp -R pob/runtime/lua/*.lua pobfe; \
		cp -R pob/src/* pobfe; \
		cp lcurl.so pobfe

#### Actual Build stuff

build:
	meson -Dbuildtype=release pobfrontend build; \
		pushd build; \
		ninja; \
		popd

lcurl.so:
	pushd lua-curl; \
		LUA_IMPL=luajit make; \
		mv lcurl.so ../lcurl.so; \
		popd

#### Git things

.PHONY: git_init
git_init:
	git submodule update --init --recursive

.PHONY: git_reset
git_reset: git_init
	git submodule foreach git reset --hard
	git submodule foreach git clean -fd

.PHONY: git_pull
git_pull: git_reset
	git submodule foreach git pull

#### Tools required for things to work

.PHONY: tools
tools: qt lua zlib meson

.PHONY: qt
qt:
	brew install qt5

.PHONY: lua
lua:
	brew install luajit

.PHONY: zlib
zlib:
	brew install zlib

.PHONY: meson
meson:
	brew install meson

#### Clean-up Tasks

.PHONY: clean_build
clean_build: clean_fe
	rm -rf build

.PHONY: clean_lcurl
clean_lcurl:
	rm -rf lcurl.so

.PHONY: clean_fe
clean_fe:
	rm -rf pobfe

.PHONY: clean_all
clean_all: clean_fe clean_lcurl clean_build

#### Go nuclear

.PHONY: nuke
nuke: clean_all git_reset
