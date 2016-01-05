# Install command-line tools using Homebrew

# Ensure everything is configured correctly
brew doctor

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Include some goodies to remove dependancies
brew tap beeftornado/rmtree && brew install brew-rmtree

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# Install some other useful utilities like `sponge`
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --with-default-names


# Install Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
brew install bash
# regular bash-completion package is held back to an older release, so we get latest from versions.
#   github.com/Homebrew/homebrew/blob/master/Library/Formula/bash-completion.rb#L3-L4
brew tap homebrew/versions
brew install homebrew/versions/bash-completion2

# generic colouriser  http://kassiopeia.juls.savba.sk/~garabik/software/grc/
brew install grc

# Install wget with IRI support
brew install wget --with-iri

# Install more recent versions of some OS X tools
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen

# Install other useful binaries
brew install ack
brew install redis
brew install beanstalkd
brew install postgres

#install exiv2
brew install git
brew install imagemagick --with-webp
brew install node # This installs `npm` too using the recommended installation method
brew install pv
brew install rename
brew install sslmate
brew install tree
brew install zopfli
brew install ffmpeg --with-libvpx
brew install android-platform-tools
brew install s3cmd
brew install gpg

# Remove outdated versions from the cellar
brew cleanup
