#!/bin/bash

# make sure the script is being executed with superuser privileges
SUPERUSER_ID=$(id -u root)
CURRENT_USER_ID=$(id -u)

if [[ ${SUPERUSER_ID} -ne ${CURRENT_USER_ID} ]]
then
	echo "Operation failed. Please execute the script as root user."
	exit 1
fi

# if the user doesn't supply at least one argument, then give them help
if [[ ${#} -lt 1 ]]
then
        echo "ERROR: at least one parameter is required"
        echo "Usage: ${0} USERNAME [COMMENT]..."
	exit 1  
fi

# generate password
PASSWORD=$(date +%s%N | sha256sum | head -c32)

# create the user with the password 
USERNAME=${1}

shift
COMMENT="${@}"

useradd -c "${COMMENT}" ${USERNAME}

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
