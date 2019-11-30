all: frontend pob
	mv build/pobfrontend PathOfBuilding

pob: load_pob luacurl frontend
	pushd PathOfBuilding; \
	unzip 'tree*.zip'; \
	unzip runtime-win32.zip lua/xml.lua lua/base64.lua lua/sha1.lua; \
	mv lua/*.lua .; \
	rmdir lua; \
	cp ../lcurl.so .; \
	popd

frontend: load_frontend
	meson -Dbuildtype=release pobfrontend build; \
	pushd build; \
	ninja; \
	popd

load_pob:
	git clone git@github.com:ManWithBear/PathOfBuilding.git

load_frontend:
	git clone git@github.com:ManWithBear/pobfrontend.git

luacurl:
	git clone git@github.com:Lua-cURL/Lua-cURLv3.git; \
	pushd Lua-cURLv3; \
	sed -i '' 's/\?= lua/\?= luajit/' Makefile; \
	make; \
	mv lcurl.so ../lcurl.so; \
	popd

tools: qt lua zlib meson

qt:
	brew install qt5

lua:
	brew install luajit

zlib:
	brew install zlib

meson:
	brew install meson

clean:
	rm -rf PathOfBuilding pobfrontend Lua-cURLv3 lcurl.so build
