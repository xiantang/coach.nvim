#!/bin/bash

echo "Run keylogger Installer"

# check if exist using `which`

which keylogger >/dev/null 2>&1

if [ $? -eq 0 ]; then
	echo "keylogger already installed"
	exit 0
else
	echo "keylogger not installed"
	echo "Installing keylogger"
	sudo apt-get install keylogger
fi
