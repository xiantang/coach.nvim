#!/bin/bash

# https://github.com/GiacomoLaw/Keylogger

echo "Run keylogger Installer"

# check if exist using `which`

which keylogger >/dev/null 2>&1

if [ -f ~/.local/share/nvim/coach/keylogger ]; then
	echo "keylogger already installed"
	exit 0
fi

echo "keylogger not installed"
echo "Installing keylogger"
rm -rf /tmp/Keylogger
git clone https://github.com/GiacomoLaw/Keylogger /tmp/keylogger && cd /tmp/keylogger/mac
make
mkdir -p ~/.local/share/nvim/coach/
mv keylogger ~/.local/share/nvim/coach/

echo "keylogger Installed"
