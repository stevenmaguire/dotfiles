# Install and configure php, apache, mysql using Homebrew

brew tap homebrew/dupes
brew tap homebrew/versions

# Install PHP
brew tap homebrew/homebrew-php
brew install php54
brew install php55
brew install php56


# Remove outdated versions from the cellar
brew cleanup
