#!/bin/bash

# This script uninstall Ghidra and the Java version that was installed for it.

sudo apt-get remove --purge openjdk-17-jdk
sudo apt-get autoremove
sudo apt-get clean
cd ../../../../opt
sudo rm -rf ghidra

echo "Ghidra and Java have been uninstalled."
