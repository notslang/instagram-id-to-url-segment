.PHONY: build unbuild test

build: src/*.coffee
src/*.coffee:
	cp -R lib src
	npx coffee -c lib
	rm lib/*.coffee

unbuild: lib/*.coffee
lib/*.coffee:
	rm -rf lib
	mv src lib

test: src/*.coffee
	npx coffee -c test && npx mocha
	rm test/*.js
