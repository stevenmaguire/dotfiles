# Install command-line tools using Homebrew

# Ensure everything is configured correctly
brew doctor

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Include some goodies to remove dependancies
brew tap beeftornado/rmtree

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# Install some other useful utilities like `sponge`
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# Install GNU `sed`
brew install gnu-sed
# Install dock utils
brew install dockutil

# Install wget with IRI support
brew install wget

# Install more recent versions of some OS X tools
brew install contacts
brew install grep
brew install screen
brew install vim

# Install other useful binaries
brew tap heroku/brew && brew install heroku
brew install ack
brew install git
brew install imagemagick
brew install pv
brew install rename
brew install tree
brew install zopfli
brew install ffmpeg
brew install awscli
brew install s3cmd
brew install gpg
brew install z
brew install docker

# Remove outdated versions from the cellar
brew cleanup
