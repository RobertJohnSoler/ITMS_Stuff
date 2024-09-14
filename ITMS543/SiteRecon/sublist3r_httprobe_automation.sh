#!/bin/bash

site=$1
sublist3r -d $site | sed -n '/\[\-\] Total Unique Subdomains Found:/,${//!p}' > domains.txt
sed -i '/^\s*$/d' domains.txt
sed 's/\x1b\[[0-9;]*m//g' domains.txt > domains_cleaned.txt 
cat domains_cleaned.txt | httprobe 