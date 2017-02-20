#!/bin/bash

# Bash script to install Bcoin onto a Debian or Ubuntu system using Git.
#
# Run as root:
# sudo bash install-bcoin.sh

DISTRO="$(lsb_release -sc)"
NODE_VERSION=node_6.x
BCOIN_REPO=https://github.com/bcoin-org/bcoin.git
BCOIN_VERSION=v1.0.0-beta

# Add Node.js repository
wget -O - https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
echo "deb http://deb.nodesource.com/$NODE_VERSION $DISTRO main" > /etc/apt/sources.list.d/nodesource.list
echo "deb-src http://deb.nodesource.com/$NODE_VERSION $DISTRO main" >> /etc/apt/sources.list.d/nodesource.list

# Install Node.js and Git
apt-get update
apt-get install -y nodejs build-essential git

# Download Bcoin
git clone $BCOIN_REPO
cd bcoin
git checkout $BCOIN_VERSION

# Install Bcoin globally
npm install -g --production

# Clean up
cd ..
rm -r bcoin

# Done
echo
echo "Run \`bcoin\`"
echo
