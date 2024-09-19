#!/bin/bash

site=$1
echo "Running active recon automation on the website $site..." 

nmap $site > site_ports.txt
gobuster dir -u https://$site -w /usr/share/wordlists/dirb/common.txt > site_directories.txt
echo ""
echo "Active recon finished."