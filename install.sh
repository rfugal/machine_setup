#!/usr/bin/env bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ${homedir}/setup
# And also installs Homebrew Packages
# And sets Sublime preferences
############################

if [ "$#" -ne 1 ]; then
    echo "Usage: install.sh <home_directory>"
    exit 1
fi

homedir=$1

# setup directory
setupdir=${homedir}/machine_setup

# list of files/folders to symlink in ${homedir}
files="bash_profile bashrc bash_prompt aliases private"

# change to the setup directory
echo "Changing to the ${setupdir} directory"
cd ${setupdir}
echo "...done"

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${setupdir}/.${file} ${homedir}/.${file}
done

# Linux Setup
sudo apt install curl

# Download Git Auto-Completion
curl "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash" > ${homedir}/.git-completion.bash

# Install and Setup Homebrew

# Set up VSCode and Sublime

# change to the home directory
echo "Changing to the ${homedir} directory"
cd ${homedir}
echo "...done"

# Install Node, Twilio CLI, and AWS CLI
sudo apt install nodejs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm install --lts
nvm use v.12.18.3
sudo apt-get install libsecret-1-dev
npm install twilio-cli -g
# curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# unzip awscliv2.zip
# sudo ./aws/install
# rm awscliv2.zip
