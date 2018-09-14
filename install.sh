#!/usr/bin/env bash

unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='macos'
fi

echo $platform

if [[ "$platform" == 'linux' ]]; then

  sudo apt install pip
  pip install ansible

elif [[ "$platform" == 'macos' ]]; then

  # Install homebrew
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  # Install ansible
  brew install ansible

fi

# Clone ansible role prepd-cli
mkdir ~/.ansible/roles
cd ~/.ansible/roles
if [ ! -d "prepd-cli" ]; then
  git clone git@github.com:rjayroach/prepd-cli.git
fi
cd /usr/local/bin
curl https://raw.githubusercontent.com/rjayroach/prepd/master/prepd -o prepd
chmod +x prepd
