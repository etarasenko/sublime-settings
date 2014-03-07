#!/bin/bash

set -e
cd `dirname $0`

h1() {
    echo -e "\n\e[32m$1\e[00m"
}

h1 "Installing font Source Code Pro:"
URL="http://sourceforge.net/projects/sourcecodepro.adobe/files/SourceCodePro_FontsOnly-1.017.zip/download"
wget ${URL} -O /tmp/SourceCodePro.zip
mkdir -p ~/.fonts/SourceCodePro
unzip -jo /tmp/SourceCodePro.zip "*.otf" -d ~/.fonts/SourceCodePro
rm /tmp/SourceCodePro.zip
fc-cache -fv

h1 "Installing linters:"
sudo apt-get install -y python-pip
sudo pip install --upgrade flake8
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y nodejs
sudo npm install -g csslint jshint

h1 "Installing package manager:"
mkdir -p "../../Installed Packages"
URL="https://sublime.wbond.net/Package%20Control.sublime-package"
wget ${URL} -O "../../Installed Packages/Package Control.sublime-package"

h1 "Please run Sublime Text and wait for some time to download packages"
