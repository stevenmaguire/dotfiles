# Install and configure php

## http://getgrav.org/blog/mac-os-x-apache-setup-multiple-php-versions

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

function gettimezone() {
    TZ_STRING="$(sudo systemsetup -gettimezone)"

    echo ${TZ_STRING/Time\ Zone\:/}
}

#------------------------------
# PHP
#------------------------------

# Install PHP
brew tap homebrew/homebrew-php
brew install php54
brew unlink php54
brew install php55
brew unlink php55
brew install php56
brew unlink php56
brew install php70
brew unlink php70
brew install php71
brew unlink php71
brew install php72
brew unlink php72

# Install APC and Xdebug for PHP 5.4
./bin/sphp 54
brew install php54-apc
brew install php54-xdebug
brew install php54-mcrypt
brew install php54-mongo
sudo sed -i "s|;date.timezone =|date.timezone = \"$(gettimezone)\"|g" $(brew --prefix)/etc/php/5.4/php.ini

# Install APC and Xdebug for PHP 5.5
./bin/sphp 55
brew install php55-opcache
brew install php55-apcu
brew install php55-xdebug
brew install php55-mcrypt
brew install php55-mongo
sudo sed -i "s|;date.timezone =|date.timezone = \"$(gettimezone)\"|g" $(brew --prefix)/etc/php/5.5/php.ini

# Install APC and Xdebug for PHP 5.6
./bin/sphp 56
brew install php56-opcache
brew install php56-apcu
brew install php56-xdebug
brew install php56-mcrypt
brew install php56-mongo
sudo sed -i "s|;date.timezone =|date.timezone = \"$(gettimezone)\"|g" $(brew --prefix)/etc/php/5.6/php.ini

# Install APC and Xdebug for PHP 7.0
./bin/sphp 70
brew install php70-opcache
brew install php70-apcu
brew install php70-xdebug
brew install php70-mcrypt
sudo sed -i "s|;date.timezone =|date.timezone = \"$(gettimezone)\"|g" $(brew --prefix)/etc/php/7.0/php.ini

# Install APC and Xdebug for PHP 7.1
./bin/sphp 71
brew install php71-opcache
brew install php71-apcu
brew install php71-xdebug
brew install php71-mcrypt
brew install php71-mongodb
sudo sed -i "s|;date.timezone =|date.timezone = \"$(gettimezone)\"|g" $(brew --prefix)/etc/php/7.1/php.ini

# Install APC and Xdebug for PHP 7.2
./bin/sphp 72
brew install php72-opcache
brew install php72-apcu
brew install php72-xdebug
brew install php72-intl
sudo sed -i "s|;date.timezone =|date.timezone = \"$(gettimezone)\"|g" $(brew --prefix)/etc/php/7.2/php.ini

# Remove outdated versions from the cellar
brew cleanup

# Create module path
sudo mkdir -p $(brew --prefix)/lib
sudo touch $(brew --prefix)/lib/libphp5.so

#------------------------------
# Use PHP 7.0
#------------------------------

./bin/sphp 70

#------------------------------
# Install composer, and two tools (assuming the symlinks haven't run yet)
#------------------------------
COMPOSER_BINARY="./bin/composer"
if [ ! -f $COMPOSER_BINARY ]; then
    curl -sS https://getcomposer.org/installer | php
    chmod +x composer.phar
    sudo mv composer.phar $COMPOSER_BINARY
fi
# Install laravel tools
eval "$COMPOSER_BINARY global require laravel/installer"
eval "$COMPOSER_BINARY global require laravel/spark-installer"
unset COMPOSER_BINARY

