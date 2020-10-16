# copy paste this file in bit by bit.
# don't run it.
  echo "do not run this script in one go. hit ctrl-c NOW"
  read -n 1

# Homebrew!
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
sudo chown -R $(whoami) $(brew --prefix)/*

# Xcode - Download Xcode and command line tools via App Store
xcode-select --install

# Install all the things
./brew.sh
./brew-cask.sh

# Bash
./bash.sh

# Storage
./storage.sh

# PHP
./php.sh

# Ruby
./ruby.sh

# JavaScript
./js.sh

# Git helpers
./git.sh

# Setup symlinks to home directory
./symlink-setup.sh

