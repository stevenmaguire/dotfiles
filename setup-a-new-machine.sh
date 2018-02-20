# copy paste this file in bit by bit.
# don't run it.
  echo "do not run this script in one go. hit ctrl-c NOW"
  read -n 1

# read migration.md where more migrationy tips are!

# homebrew!
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Xcode!
# Download Xcode and command line tools via App Store
xcode-select --install

# install all the things
./brew.sh
./brew-cask.sh

# Storage
./storage.sh

# PHP
./php.sh

# Ruby
./ruby.sh

# Dropbox symlinks
./dropbox.sh

# Git helpers
./git.sh

# for the c alias (syntax highlighted cat)
sudo easy_install Pygments

# change to bash 4 (installed by homebrew)
BASHPATH=$(brew --prefix)/bin/bash
sudo bash -c 'echo $BASHPATH >> /etc/shells'
# Change to the new shell
chsh -s /usr/local/bin/bash
echo $BASH_VERSION # should be 4.x not the old 3.2.X

# Later, confirm iterm settings aren't conflicting.

# symlinks!
#   put/move git credentials into ~/.gitconfig.local
#   http://stackoverflow.com/a/13615531/89484
./symlink-setup.sh

