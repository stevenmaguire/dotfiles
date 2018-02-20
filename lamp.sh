# Install and configure php, apache, mysql using Homebrew

## http://getgrav.org/blog/mac-os-x-apache-setup-multiple-php-versions

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
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
sudo mkdir -p /usr/local/lib
sudo touch /usr/local/lib/libphp5.so

#------------------------------
# MySQL
#------------------------------
brew install mysql
unset TMPDIR
mysql.server start


#------------------------------
# Use PHP 7.0
#------------------------------

./bin/sphp 70

#------------------------------
# Install composer
#------------------------------
COMPOSER_BINARY="./bin/composer"
if [ ! -f $COMPOSER_BINARY ]; then
    curl -sS https://getcomposer.org/installer | php
    chmod +x composer.phar
    sudo mv composer.phar $COMPOSER_BINARY
fi
unset COMPOSER_BINARY

#------------------------------
# Install phpunit
#------------------------------
PHPUNIT_BINARY="./bin/phpunit"
if [ ! -f $PHPUNIT_BINARY ]; then
    wget https://phar.phpunit.de/phpunit.phar
    chmod +x phpunit.phar
    sudo mv phpunit.phar $PHPUNIT_BINARY
fi
unset PHPUNIT_BINARY

#------------------------------
# Install php code sniffer
#------------------------------
CS_BINARY="./bin/phpcs"
if [ ! -f $CS_BINARY ]; then
    curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar
    chmod +x phpcs.phar
    sudo mv phpcs.phar $CS_BINARY
fi
unset CS_BINARY

CSF_BINARY="./bin/phpcbf"
if [ ! -f $CSF_BINARY ]; then
    curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar
    chmod +x phpcbf.phar
    sudo mv phpcbf.phar $CSF_BINARY
fi
unset CSF_BINARY

#------------------------------
# Install gulp globally
#------------------------------
sudo npm install -g gulp

#------------------------------
# Install laravel tools
#------------------------------
composer global require laravel/installer
composer global require laravel/spark-installer

#------------------------------
# Some helpful tips
#------------------------------
echo "Tip: Run mysql_secure_installation to configure mysql users"
