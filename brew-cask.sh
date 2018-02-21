# to maintain cask ....
#     brew update && brew cleanup && brew cask cleanup

brew tap caskroom/cask
brew tap caskroom/versions

## Install native apps

# daily
brew cask install dropbox
brew cask install evernote

# dev
brew cask install ccmenu
brew cask install postico
brew cask install postman
brew cask install sequel-pro
brew cask install sublime-text

# browsers
brew cask install google-chrome
# brew cask install google-chrome-canary
# brew cask install firefox
# brew cask install firefox-nightly --force
# brew cask install webkit-nightly --force
# brew cask install chromium --force
# brew cask install torbrowser

# collaboration
brew cask install slack

# less often
brew cask install adobe-creative-cloud
brew cask install transmit
brew cask install unrarx
