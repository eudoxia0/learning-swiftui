NAME := HelloWorld
BIN := Build/$(NAME).app/Contents/MacOS/$(NAME)
PLIST := Build/$(NAME).app/Contents/Info.plist
ICON := Build/$(NAME).app/Contents/Resources/Icon.icns

all: $(BIN) $(PLIST) $(ICON)

$(BIN): Source/*.swift
	mkdir -p Build/$(NAME).app/Contents/MacOS
	swiftc -parse-as-library -o $(BIN) Source/main.swift

$(PLIST): Data/Info.json
	mkdir -p Build/$(NAME).app/Contents
	plutil -convert binary1 -o $(PLIST) Data/Info.json

$(ICON): Data/Icon.icns
	mkdir -p Build/$(NAME).app/Contents/Resources
	cp Data/Icon.icns $(ICON)

.PHONY: run
run:
	open Build/HelloWorld.app

.PHONY: clean
clean:
	rm -rf Build
