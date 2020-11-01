#!/bin/bash
# Clone app from url
git clone $giturl
# Find the only available directory that git produced and  change to it
appdir=`ls -d */`
cd $appdir
# Create the config file for the application with the base64 encoded setting string
cat > config.js << EOL
var config = $appconfig;
module.exports = config;
EOL
# Install needed components that package.json mentions and finally execute the CMD command mentioned in the Dockerfile
npm install
exec $1 $2
