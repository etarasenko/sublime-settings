#!/bin/bash

set -e
cd `dirname $0`/..

h1() {
    echo -e "\n\e[32m$1\e[00m"
}

h1 "Installing requirements for SublimeLinter:"
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y nodejs npm
sudo npm install -g csslint jshint

git-clone() {
    # Clone or update git repository
    if [ -d "$2" ]; then
        pushd "$2" > /dev/null
        git pull
        popd > /dev/null
    else
        git clone $1 "$2"
    fi
}

h1 "Installing additional Sublime packages:"
git-clone https://github.com/buymeasoda/soda-theme.git "Theme - Soda"
git-clone https://github.com/Kronuz/SublimeCodeIntel.git SublimeCodeIntel
git-clone https://github.com/SublimeLinter/SublimeLinter.git SublimeLinter
git-clone https://github.com/SublimeText/jQuery.git jQuery
