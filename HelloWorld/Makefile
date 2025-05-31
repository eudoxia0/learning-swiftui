NAME := HelloWorld
BIN := Build/$(NAME).app/Contents/MacOS/$(NAME)
PLIST := Build/$(NAME).app/Contents/Info.plist

all: $(BIN) $(PLIST)

$(BIN): Source/*.swift
	mkdir -p Build/$(NAME).app/Contents/MacOS
	swiftc -parse-as-library -o $(BIN) Source/main.swift

$(PLIST): Data/Info.json
	mkdir -p Build/$(NAME).app/Contents
	plutil -convert binary1 -o $(PLIST) Data/Info.json

.PHONY: clean
clean:
	rm -rf Build
