# copy paste this file in bit by bit.
# don't run it.
  echo "do not run this script in one go. hit ctrl-c NOW"
  read -n 1

# Xcode - Download Xcode and command line tools via App Store
xcode-select --install

# Install Rosetta (to support Intel binaries)
softwareupdate --install-rosetta --agree-to-license

# Install all the things
./brew.sh

# Bash
./bash.sh

# PHP
./php.sh

# Ruby
./ruby.sh

# JavaScript
./js.sh

# Setup symlinks to home directory
./symlink-setup.sh

# Setup SSH keys
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

# Setup sublime text
./sublime.sh