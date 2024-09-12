#!/bin/bash


while :
do
	echo "Please enter a password:"
	read password
	
	if (( ${#password} < 8 )); then
	  echo "Password has to be at least 8 characters long"
	  continue
	fi

	if [[ ! "$password" =~ [[:upper:]] ]]; then
	  echo "Password needs to have at least 1 uppercase character."
	  continue
	fi

	if [[ ! "$password" =~ [[:lower:]] ]]; then
	  echo "Password needs to have at least 1 lowercase character."
	  continue
	fi 

	if [[ ! "$password" =~ [0-9] ]]; then
	  echo "Password needs to have at least 1 number."
	  continue
	fi 
	
	if [[ ! $password =~ [[:punct:]] ]] then
	  echo "Password needs to have at least 1 special character."
	  continue
	fi 
	
	crackLibCheck=$(echo $password | cracklib-check)
	if [[ ${crackLibCheck: -2} != "OK" ]]; then
	  echo "Password is too weak/common."
	  continue
	fi
	
	echo "Password accepted."
	break
done
