all: 
	swift build

osx:
	swiftc Sources/*.swift -o semver-incrementer
