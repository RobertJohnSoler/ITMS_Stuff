#!/bin/bash

# This script makes a backup of the user's (in my case, harry) directory and saves it in the /home directory.

echo "Running backup.sh..." 
echo "Running backup.sh..." > backup_output.txt

source_dir="/home/harry"	# setting /harry as the directory to back up
dest_dir="/home"		# setting /home as the directory where the backup will be stored

echo "Backing up $source_dir and saving it in $dest_dir..."
echo "Backing up $source_dir and saving it in $dest_dir..." >> backup_output.txt

# We include the date when naming the backup for ease of identification.
date=$(date +"%Y-%m-%d_%H-%M-%S") >> backup_output.txt	 

# We make the backup by compressing the whole /harry directory.
backup="$dest_dir/harry_backup_$date.tar.gz" >> backup_output.txt	
tar -czf "$backup" -C "$source_dir" . >> backup_output.txt

echo "Backup created and saved to $dest_dir."
echo "Backup created and saved to $dest_dir." >> backup_output.txt
