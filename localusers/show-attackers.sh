#!/bin/bash

LIMIT=10

# Make sure a file was supplied as an argument.
LOG_FILE="${1}"
if [[ ! -e "${LOG_FILE}" ]]
then
	echo "Cannot open log file: ${LOG_FILE}" >&2
	exit 1
fi

# Display the CSV header.
echo "Count,IP,Location"

# Loop through the list of failed attempts and corresponding IP addresses.
# If the number of failed attempts is greater than the limit, display count, IP, and location.
grep Failed ${LOG_FILE} | awk '{print $((NF-3))}' | sort | uniq -c | sort -nr | while read COUNT IP
do
	if [[ ${COUNT} -gt ${LIMIT} ]]
	then
		LOCATION=$(geoiplookup ${IP} | awk -F ',' '{ print $2 }')
		echo "${COUNT}, ${IP}, ${LOCATION}"
	fi
done
