#!/bin/bash

# this script demonstrate case statement

case "${1}" in
  start)
    echo 'starting.'
    ;;
  stop)
    echo 'Stopping.'
    ;;
  status|state|--status|--state)
    echo 'Status:'
    ;;
  *)
    echo 'Supply a valid option.' >&2
    exit 1
    ;;
esac

# example
# /etc/init.d/sshd status
# /etc/init.d/sshd stop
