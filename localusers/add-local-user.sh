#!/bin/bash

# make sure the script is being executed with superuser privileges
SUPERUSER_ID=$(id -u root)
CURRENT_USER_ID=$(id -u)

if [[ ${SUPERUSER_ID} -ne ${CURRENT_USER_ID} ]]
then
	echo "Operation failed. Please execute the script as root user."
	exit 1
fi

# get the username
read -p "Enter the username: " USERNAME

# get the full name
read -p "Enter the full name: " FULLNAME

# get the password
read -p "Enter the password: " PASSWORD

# create the user with the password 
useradd -c "${FULLNAME}" ${USERNAME}

# check to see if the useradd command succeed
if [[ ${?} -ne 0 ]]
then
	echo "failed to creat the user."
	exit 1
fi

# set the password
echo "${PASSWORD}" | passwd --stdin ${USERNAME}

# check to see if the passwd command succeed
if [[ ${?} -ne 0 ]]
then
	echo "failed to set the password"
	exit 1
fi

# force password change on first login
passwd -e ${USERNAME}

# display the username, password and host where the user was created
echo "The account is created. You'll be prompted to change password when first login."
echo "Username: " ${USERNAME}
echo "Password: " ${PASSWORD}
echo "Hostname: " $(hostname)
