#!/bin/bash

# this script creates an account on the local system
# you will be prompted for the account name and password

# ask for username
read -p 'Enter the username to create: ' USER_NAME

# ask for real name
read -p 'Enter the full name of the person who this account is for: ' COMMENT

# ask for password
read -p 'Enter the password: ' PASSWORD

# create the user
useradd -c "${COMMENT}" -m ${USER_NAME}
# double quote around ${COMMENT}: this variable may contain space, they will be treated as a single item

# set the password for the user
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# force password change on first login
passwd -e ${USER_NAME}
