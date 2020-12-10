#!/bin/bash

# help function
# best practice: use local variables inside the function
# global variable inside a function are not visible to the outside until the function is executed

log() {
	local MESSAGE="${@}"
	if [[ "${VERBOSE}" = 'true' ]]
	then
		echo "${MESSAGE}"
	fi
}

# when use a global variable in the function, consider the variable to be "readonly"
# to avoid the conflict rising from multiple functions changing one global variable 
# readonly: the value of the variable is not changable

readonly VERBOSE='true'
log "${VERBOSITY}" 'Hello!'
log "${VERBOSITY}" 'This is fun!'


