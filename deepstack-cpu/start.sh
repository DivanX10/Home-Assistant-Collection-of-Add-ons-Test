#!/bin/bash
  
# turn on bash's job control
set -m
  
# Start the primary process and put it in the background
CMD ['/app/server/server'] &
  
# Start the helper process
touch /data/test.txt