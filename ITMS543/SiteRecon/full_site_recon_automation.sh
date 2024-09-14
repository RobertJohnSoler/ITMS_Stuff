#!/bin/bash

# Usage: ./full_site_recon_automation.sh <website>

site=$1
echo "Running passive website recon automation on the website $site..." 
echo "Site info:" > site_info.txt
whois $site >> site_info.txt
echo "" >> site_info.txt
echo "DNS info: " >> site_info.txt
nslookup $site >> site_info.txt
sudo ./sublist3r_httprobe_automation.sh $site > working_domains.txt
gobuster dir -u https://$site -w /usr/share/wordlists/dirb/common.txt > site_directories.txt
echo ""
echo "Passive recon automation finished."
