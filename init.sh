#!/bin/bash
LOG_PATH=$appmodule/logs
if [ ! -d $appmodule ]; then
	git clone https://github.com/aknts/$appmodule
	mkdir $appmodule/logs
	npm install mqtt
	echo $appmodule installed
fi
fileout="$LOG_PATH/$COMPONENT_$(date +%Y-%m-%d.%H:%M:%S).out"
fileerr="$LOG_PATH/$COMPONENT_$(date +%Y-%m-%d.%H:%M:%S).err"
echo $fileout
echo $fileerr
echo $appmodule
exec $1 $appmodule/$2
