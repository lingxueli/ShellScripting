#!/bin/bash

# demonstrate the use of shift and while loops

# display the first three parameters
echo "Parameter 1: ${1}"
echo "Parameter 2: ${2}"
echo "Parameter 3: ${3}"
echo

# type -a while
# help while

# type -a true
# help true

# type -a sleep
# man sleep

# type -a shift
# help shift

# loop through all the positional parameters
while [[ "${#}" -gt 0 ]]
do
	echo "Number of parameters: ${#}"
	echo "Parameter 1: ${1}"
	echo "Parameter 2: ${2}"
	echo "Parameter 3: ${3}"
	echo
	shift
done
