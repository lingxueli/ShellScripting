#!/bin/bash

# display the UID and username of the user executing the script
# display if the user is the vagrant user or not

# display UID
echo "Your UID is ${UID}"

# only display if the UID is NOT 1000
UID_TO_TEST_FOR='1000'
if [[ "${UID}" -ne "${UID_TO_TEST_FOR}" ]]
then
        echo "Your UID doesn't match ${UID_TO_TEST_FOR}"
	exit 1
fi

# display the username
USER_NAME=$(id -un)

# test if the command succeeded
if [[ "${?}" -ne 0 ]] ## ? is the variable stores the exit status of the last ommand that was executed
then
	echo 'The id command did not execute successfully'
	exit 1
fi
echo "Your username is ${USER_NAME}"

# test if the user is vagrant user or not
USERNAME_TO_TEST_FOR='vagrant'
if [[ "${USER_NAME}" = "${USERNAME_TO_TEST_FOR}" ]] 
# "=" can be a test operator
# if [[ "${USER_NAME}" == "${USER_NAME_TO_TEST_FOR}" ]]  ## it's a valid syntax too
# "==" can perform pattern matching, it's used when the right side of the operator is a pattern
# "=" only test exact match
then
	echo "Your username matches ${USERNAME_TO_TEST_FOR}."
fi

if [[ "${USER_NAME}" != "${USERNAME_TO_TEST_FOR}" ]]
then
	echo "Your username does not match ${USERNAME_TO_TEST_FOR}."
	exit 1
fi

exit 0
