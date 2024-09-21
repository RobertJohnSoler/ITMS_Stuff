#!/bin/bash

# This script installs Ghidra, a reverse engineering tool made by NSA, to the host's machine.

echo "Running install_ghidra.sh..."
echo "Running install_ghidra.sh..." > install_ghidra_output.txt

# Ghidra runs on Java, so we'll install Java first.
echo "Installing Java..."
echo "Installing Java..." >> install_ghidra_output.txt
sudo apt install openjdk-17-jdk

# There is a github repo containing all the released versions of Ghidra. Let's use v11.0.
echo "Downloading the Ghidra 11.0 zip file from the official Github repo..." 
echo "Downloading the Ghidra 11.0 zip file from the official Github repo..." >> install_ghidra_output.txt
wget https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_11.0_build/ghidra_11.0_PUBLIC_20231222.zip -O ghidra_11.zip >> install_ghidra_output.txt

# We'll move the downloaded zip file to /opt because this directory is where we store our optional software.
sudo mv ghidra_11.zip /opt/

cd ~/../../opt  

# Now we unzip and install Ghidra
echo "Unzipping and installing Ghidra..." 
echo "Unzipping and installing Ghidra..." >> /home/harry/ITMS548/install_ghidra_output.txt 
sudo unzip ghidra_11.zip >> /home/harry/ITMS548/install_ghidra_output.txt 
sudo rm -r ghidra_11.zip >> /home/harry/ITMS548/install_ghidra_output.txt 

sudo mv ghidra_11.0_PUBLIC ghidra

# Now the installation is complete. 
echo "Installation complete." 
echo "Installation complete." >> /home/harry/ITMS548/install_ghidra_output.txt 
echo "Run Ghidra by navigating to /opt/ghidra and running ./ghidraRun." 
echo "Run Ghidra by navigating to /opt/ghidra and running ./ghidraRun." >> /home/harry/ITMS548/install_ghidra_output.txt  
