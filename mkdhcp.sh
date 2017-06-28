#!/bin/bash

prefix="192.168.93."
ip=2


while read -r name mac 
do
     if [[ ${name:0:1} == "n" ]]; then 
	echo "host $name {"
	echo "	hardware ethernet $mac;"
	echo "	fixed-address $prefix$ip;"
	echo "	option host-name \"e$name\";"
	echo "	filename \"pxelinux.0\";"
	echo "}"
	ip=$((ip + 1))
     fi 
done < $1 
