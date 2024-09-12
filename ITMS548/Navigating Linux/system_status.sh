#!/bin/bash

# This script shows basic system statistics for the host machine, such as CPU usage, RAM usage, Disk space, and Network usage.

# We need to install bc for calculating floating-point values for the percentages.
sudo apt-get install bc

# This portion of the script shows the CPU usage details.
# It is based off of the top command and displays the most important details only.
echo ""
echo "" > system_status_output.txt
echo CPU USAGE:
echo CPU USAGE: >> system_status_output.txt
cpu_used=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')%  
cpu_free=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')%
echo -e ' \t 'Used: $cpu_used
echo -e ' \t 'Free: $cpu_free
echo -e ' \t 'Used: $cpu_used >> system_status_output.txt
echo -e ' \t 'Free: $cpu_free >> system_status_output.txt

# This portion of the script shows the memory usage details.
# It is based off of the free command and displays the most important details only.
echo ""
echo "" >> system_status_output.txt
echo MEMORY USAGE:
echo MEMORY USAGE: >> system_status_output.txt
ram_total=$(free | awk '/Mem/ {printf $2}')
ram_used=$(free | awk '/Mem/ {printf $3}')
ram_free=$(free | awk '/Mem/ {printf $4}')
ram_percent=$(echo "scale=2; ($ram_used / $ram_total) * 100" | bc)%
echo -e ' \t '$ram_used bytes of $ram_total bytes used, $ram_free bytes available.
echo -e ' \t '$ram_used bytes of $ram_total bytes used, $ram_free bytes available. >> system_status_output.txt
echo -e ' \t '$ram_percent of the RAM is used.
echo -e ' \t '$ram_percent of the RAM is used. >> system_status_output.txt
 
# This portion of the script shows the disk usage details.
# It is based off of the df command.
echo ""
echo "" >> system_status_output.txt
echo DISK USAGE:
echo DISK USAGE: >> system_status_output.txt
df | sed 's/^/         /'
df | sed 's/^/         /' >> system_status_output.txt
