#!/bin/bash

# display various info to the screen

WORD='test'

# display the value using the variable
echo "$WORD"

# single quotes cause variables to NOT get expanded
echo '$WORD'

# display the conect using an alternative syntax
echo "${WORD}"

# Append text to the variable using the alternative syntax
echo "${WORD}ing"
# this doesn't work
echo "$WORDing"
