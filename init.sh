#!/bin/bash
if [ ! -d $appmodule ]; then
	git clone https://github.com/aknts/$appmodule
	mkdir $appmodule/logs
	npm install
	cat >> config.js << EOL
		var config = $appconfig;
		module.exports = config;
EOL
	touch "logs/$appmodule_$(date +%Y-%m-%d.%H:%M:%S).out"
	touch "logs/$appmodule_$(date +%Y-%m-%d.%H:%M:%S).err"
	exec $1 $appmodule/$2
fi
