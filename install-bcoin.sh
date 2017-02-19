#!/bin/bash

# Bash script to install Bcoin onto a Debian or Ubuntu system using git.
#
# Run as root:
# sudo bash bcoin.sh

DISTRO="$(lsb_release -s -c)"
NODE_VERSION=node_6.x
BCOIN_REPO=git://github.com/bcoin-org/bcoin.git
BCOIN_VERSION=v1.0.0-beta

# Add Node.js Repository
wget -O - https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
echo "deb http://deb.nodesource.com/$NODE_VERSION $DISTRO main" | tee /etc/apt/sources.list.d/nodesource.list
echo "deb-src http://deb.nodesource.com/$NODE_VERSION $DISTRO main" | tee -a /etc/apt/sources.list.d/nodesource.list

# Install Node.js and Git
apt update
apt install -y nodejs build-essential git

# Download BCoin
git clone $BCOIN_REPO
cd bcoin
git checkout $BCOIN_VERSION

# Install BCoin
npm install -g

# Clean up
cd ..
rm -r bcoin

# Done
echo
echo "Run \`bcoin\`"
echo