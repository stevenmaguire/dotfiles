# Install command-line tools using Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sudo chown -R $(whoami) $(brew --prefix)/*

# Ensure everything is configured correctly
brew doctor

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Include some goodies to remove dependancies
brew tap beeftornado/rmtree
# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
# Collection of tools that nobody wrote when UNIX was young
brew install moreutils
# Install dock utils
brew install dockutil

# Install other useful binaries
brew install git
brew install gpg
brew install tree
brew install vim
brew install z

########################################################
## Install native apps
########################################################
# daily
brew install 1password
brew install cleanshot
brew install dropbox
brew install evernote
brew install google-chrome
brew install little-snitch
brew install micro-snitch
brew install spotify

# dev
brew install awscli
brew install dbngin
brew tap heroku/brew && brew install heroku
brew install postman
brew install sublime-text
brew install tableplus
brew install tuple

# less often
brew cask install appzapper
brew cask install transmit

# Remove outdated versions from the cellar
brew cleanup
