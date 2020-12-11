#!/bin/bash

# help function
# best practice: use local variables inside the function
# global variable inside a function are not visible to the outside until the function is executed

log() {
	# this function sends a msg to syslog and to standard output if VERBOSE is true.
	local MESSAGE="${@}"
	if [[ "${VERBOSE}" = 'true' ]]
	then
		echo "${MESSAGE}"
	fi
	logger -t user-script10.sh "${MESSAGE}"
	# sudo tail /var/log/messages
}

backup_file(){
	# this function creates a backup of a file. Returns non-zero status on error.
	local FILE="${1}"

	# make sure the file exists
	if [[ -f "${FILE}" ]]
	then
		local BACKUP_FILE="/var/tmp/$(basename ${FILE})"."$(date +%F%N)"
		log "Backing up ${FILE} to ${BACKUP_FILE}."

		# the exit status of the function will be the exit status of the cp command.
		# -p: ownership,timestamps
		cp -p ${FILE} ${BACKUP_FILE}
	else
		# the file does not exist, so return a non-zero exit status
		return 1
	fi
}

# when use a global variable in the function, consider the variable to be "readonly"
# to avoid the conflict rising from multiple functions changing one global variable 
# readonly: the value of the variable is not changable

readonly VERBOSE='true'
log "${VERBOSITY}" 'Hello!'
log "${VERBOSITY}" 'This is fun!'

backup_file '/etc/passwd'

# make a decision based on the exit status of the function
if [[ "${?}" -eq '0' ]]
then
	log 'File backup succeed!'
else
	log 'File backup failed!'
	exit 1
fi

