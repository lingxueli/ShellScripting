#!/bin/bash

# this script generates a list of random password

# generate a random number as password
PASSWORD="${RANDOM}"
echo "${PASSWORD}"

# three random numbers together as password
PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "${PASSWORD}"

# use the current date/time as the basis for the password
PASSWORD=$(date +%s)
echo "${PASSWORD}"

# use nanoseconds as the password
PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

# a better password using hash
PASSWORD=$(date +%s%N | sha256sum | head -c32)
# both "head -c32" and "head -c 32" are acceptable.
# "head -c32" is the short form to merge option and value together without a space
echo "${PASSWORD}"

# an even better password
PASSWORD=$(date +%s%N${RANDOM}${RANDOM}$RANDOM | sha256sum | head -c48)
echo "${PASSWORD}"

# append a special character to the password
SPECIAL_CHARACTER=$(echo '!@#$%^&*()_-+=' | fold -w1 | shuf | head -c1)
# experiment with the command if the doc is not clear
echo "${PASSWORD}${SPECIAL_CHARACTER}"
