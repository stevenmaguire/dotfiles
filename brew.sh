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
brew tap lotyp/homebrew-formulae && brew install lotyp/formulae/dockutil

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
brew install google-chrome
brew install spotify

# dev
brew install appzapper
brew install awscli
brew install dbngin
brew install little-snitch
brew install micro-snitch
brew install postman
brew install sublime-text
brew install tableplus
brew install transmit
brew install tuple
# Heroku CLI currently requires Rosetta on M1 arch - make sure it is installed!
brew tap heroku/brew && brew install heroku

# Remove outdated versions from the cellar
brew cleanup
