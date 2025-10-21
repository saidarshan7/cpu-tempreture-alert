##!/bin/sh

# Print something, then run ls

data=$( sensors -j)  #stores sensors data in json format
#sleep 1 

echo $data;

