WREN_VERSION = 0.3.0
.PHONY: install-mac install-linux install-windows

im install-mac:
	wget https://github.com/wren-lang/wren-cli/releases/download/${WREN_VERSION}/wren_cli-mac-${WREN_VERSION}.zip
	unzip wren_cli-mac-${WREN_VERSION}.zip
	rm -f wren_cli-mac-${WREN_VERSION}.zip
	rm -rf readme.md
	mv wren_cli wren

il install-linux:
	wget https://github.com/wren-lang/wren-cli/releases/download/${WREN_VERSION}/wren_cli-linux-${WREN_VERSION}.zip
	unzip wren_cli-linux-${WREN_VERSION}.zip
	rm -f wren_cli-linux-${WREN_VERSION}.zip
	rm -rf readme.md
	mv wren_cli wren

iw install-windows:
	wget https://github.com/wren-lang/wren-cli/releases/download/${WREN_VERSION}/wren_cli-windows-${WREN_VERSION}.zip
	unzip wren_cli-windows-${WREN_VERSION}.zip
	rm -f wren_cli-windows-${WREN_VERSION}.zip
	rm -rf readme.md
	mv wren_cli-${WREN_VERSION}.exe wren.exe