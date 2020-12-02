#!/bin/bash

# this script generates a random password for each user specified on the command line

# display what the user typed on the command line
echo "You executed this command: ${0}"
# ${0}: positional paramters; the command itself
# ${1} 1st paramenters passed the script

# display path and filename of the script
echo "You used $(dirname ${0}) as the path to the $(basename ${0}) script."

# tell the user how many argument they passed in
NUMBER_OF_PARAMETERS="${#}"
echo "You supplied ${NUMBER_OF_PARAMETERS} argument(s) on the command line."
# ${#} is on the "special parameters" section of "man bash"

# make sure at least one argument is supplied
if [[ ${NUMBER_OF_PARAMETERS} -lt 1 ]]
then
	echo "Usage: ${0} USER_NAME [USER_NAME]..."
	exit 1
fi
# these operateors can be found on "help test"

# generate and display a password for each user
for USER_NAME in "${@}"
do
	PASSWORD=$(date +%s%N | sha256sum | head -c48)
	echo "${USER_NAME}: ${PASSWORD}"
done
 
# type -a for
# for is a shell keyword (built-in)
# help for

# hashing functions
# ls -l /usr/bin/*sum
