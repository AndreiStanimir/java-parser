CXXFLAGS := -Wall -Wextra
LDFLAGS :=
BISONFLAGS := --verbose

.PHONY: compile clean

run: build/parser
	./$< CheckNumberPrime.java

compile:
	build/parser

clean:
	-rm -r build

build:
	mkdir -p build

build/common.hpp: common.hpp
	cp $< $@

build/parser: build/parser.o build/lexer.o | build
	c++ $(LDFLAGS) -o $@ $^

build/parser.o: build/parser.cpp build/common.hpp | build
	c++ $(CXXFLAGS) -c -o $@ $<

build/parser.cpp: parser.ypp | build
	bison $(BISONFLAGS) -d -o $@ $<

build/lexer.o: build/lexer.cpp build/common.hpp | build
	cc $(CFLAGS) -c -o $@ $<

build/lexer.cpp:lexer.lex | build
	flex -o $@ $<
