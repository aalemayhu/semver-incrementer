FILES ?= semver-incrementer
INSTALL_DIR ?= /usr/local/bin

all: 
	swift build

osx:
	xcrun -sdk macosx swiftc Sources/*.swift -o semver-incrementer

install:
	chmod +x $(FILES)
	cp $(FILES) $(INSTALL_DIR)/
uninstall:
	echo "Remove ${FILES} in $(INSTALL_DIR)"

