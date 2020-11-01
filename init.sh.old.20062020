#!/bin/bash

if [ ! -d $appmodule ]; then
        git clone $gitprofileurl$appmodule
        cd $appmodule
        mkdir logs
        touch logs/$appmodule_$(date +%Y-%m-%d.%H:%M:%S).out
        touch logs/$appmodule_$(date +%Y-%m-%d.%H:%M:%S).err
        cat > config.js << EOL
var config = $appconfig;
module.exports = config;
EOL
        npm install
        exec $1 $2
fi
