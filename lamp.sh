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
brew install php55
brew install php56

# Install APC and Xdebug for PHP 5.4
./bin/sphp 54
brew install php54-apc
brew install php54-xdebug
brew install php54-mcrypt
sudo sed -i "s|;date.timezone =|date.timezone = \"$(gettimezone)\"|g" $HOME/.homebrew/etc/php/5.4/php.ini

# Install APC and Xdebug for PHP 5.5
./bin/sphp 55
brew install php55-opcache
brew install php55-apcu
brew install php55-xdebug
brew install php55-mcrypt
sudo sed -i "s|;date.timezone =|date.timezone = \"$(gettimezone)\"|g" $HOME/.homebrew/etc/php/5.5/php.ini

# Install APC and Xdebug for PHP 5.6
./bin/sphp 56
brew install php56-opcache
brew install php56-apcu
brew install php56-xdebug
brew install php56-mcrypt
sudo sed -i "s|;date.timezone =|date.timezone = \"$(gettimezone)\"|g" $HOME/.homebrew/etc/php/5.6/php.ini

# Remove outdated versions from the cellar
brew cleanup

# Create module path
sudo mkdir -p /usr/local/lib
sudo touch /usr/local/lib/libphp5.so

#------------------------------
# Directories
#------------------------------

# Make projects directory and structure
WEB_ROOT=$HOME'/Projects/php/apps'
GROUP="staff"
sudo mkdir -p $WEB_ROOT
echo "<?php phpinfo();" > $WEB_ROOT"/index.php"
sudo mkdir -p $HOME"/.httpd/vhosts"
sudo touch $HOME"/.httpd/vhosts/default.conf"

#------------------------------
# Apache
#------------------------------

# Update http conf
## Fetch new default if not exists
sudo curl -o /etc/apache2/httpd.conf.default https://raw.githubusercontent.com/stevenmaguire/apache2-conf-osx/master/10.10/httpd.conf.default
sudo curl -o /etc/apache2/extra/httpd-vhosts.conf https://raw.githubusercontent.com/stevenmaguire/apache2-conf-osx/master/10.10/httpd-vhosts.conf

## Replace current with default
sudo cp /etc/apache2/httpd.conf.default /etc/apache2/httpd.conf

# Replace config defaults with custom defaults
sudo sed -i "s|User _www|User "$USER"|g" /etc/apache2/httpd.conf
sudo sed -i "s|Group _www|Group "$GROUP"|g" /etc/apache2/httpd.conf
sudo sed -i "s|#LoadModule vhost_alias_module|LoadModule vhost_alias_module|g" /etc/apache2/httpd.conf
sudo sed -i "s|#LoadModule rewrite_module|LoadModule rewrite_module|g" /etc/apache2/httpd.conf
sudo sed -i "s|#LoadModule php5_module libexec/apache2/libphp5.so|LoadModule php5_module /usr/local/lib/libphp5.so|g" /etc/apache2/httpd.conf
sudo sed -i "s|/Library/WebServer/Documents|"$WEB_ROOT"|g" /etc/apache2/httpd.conf
sudo sed -i "s|#Include /private/etc/apache2/extra/httpd-vhosts.conf|Include /private/etc/apache2/extra/httpd-vhosts.conf|g" /etc/apache2/httpd.conf

sudo sed -i "s|/Library/WebServer/Documents|"$WEB_ROOT"|g" /etc/apache2/extra/httpd-vhosts.conf
echo "Include $HOME/.httpd/vhosts/*.conf" | sudo tee -a /etc/apache2/extra/httpd-vhosts.conf

# Add current user to apache group
#dseditgroup -o edit -a $USER -t user _www

sudo apachectl restart

#------------------------------
# MySQL
#------------------------------
brew install mysql
unset TMPDIR
mysql_install_db
mysql.server start


#------------------------------
# Use PHP 5.6
#------------------------------

./bin/sphp 56

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

echo "Tip: Run mysql_secure_installation to configure mysql users"
