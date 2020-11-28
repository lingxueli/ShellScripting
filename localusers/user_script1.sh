#!/bin/bash

# display the UID and usernanme of the user executing this script
# display if the user is the root user or not

# display the UID
echo "Your UID is ${UID}"

# display the username
USER_NAME=$(id -un)

# old fashioned syntax: USER_NAME=`id -un`

echo "Your username is ${USER_NAME}"

# display if the user is the root user or not
if [[ "${UID}" -eq 0 ]] ## always enclose the ${variable} with "" doing the test
then
	echo 'You are root.'
else
	echo 'You are not root.'
fi
