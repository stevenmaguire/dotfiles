# Install and configure php, apache, mysql using Homebrew

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `lamp.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

## http://getgrav.org/blog/mac-os-x-apache-setup-multiple-php-versions

# Make projects directory and structure
WEB_ROOT=$HOME'/Projects/php/apps'
mkdir -p $WEB_ROOT
echo "<?php phpinfo();" > $WEB_ROOT"/index.php"
mkdir -p $HOME"/.http/vhosts"
touch $HOME"/.http/vhosts/default.conf"

# Install PHP
brew tap homebrew/homebrew-php
brew install php54
brew install php55
brew install php56

# Remove outdated versions from the cellar
brew cleanup

# Create module path
mkdir -p /usr/local/lib
touch /usr/local/lib/libphp5.so

# Update http conf
## Fetch new default if not exists
curl -o /etc/apache2/httpd.conf.default https://raw.githubusercontent.com/stevenmaguire/apache2-conf-osx/master/10.10/httpd.conf.default
curl -o /etc/apache2/extra/httpd-vhosts.conf https://raw.githubusercontent.com/stevenmaguire/apache2-conf-osx/master/10.10/httpd-vhosts.conf

## Replace current with default
cp /etc/apache2/httpd.conf.default /etc/apache2/httpd.conf

# Replace config defaults with custom defaults
sed -i "s|#LoadModule rewrite_module|LoadModule rewrite_module|g" /etc/apache2/httpd.conf
sed -i "s|#LoadModule php5_module libexec/apache2/libphp5.so|LoadModule php5_module /usr/local/lib/libphp5.so|g" /etc/apache2/httpd.conf
sed -i "s|/Library/WebServer/Documents|"$WEB_ROOT"|g" /etc/apache2/httpd.conf
sed -i "s|#Include /private/etc/apache2/extra/httpd-vhosts.conf|Include /private/etc/apache2/extra/httpd-vhosts.conf|g" /etc/apache2/httpd.conf

sed -i "s|/Library/WebServer/Documents|"$WEB_ROOT"|g" /etc/apache2/extra/httpd-vhosts.conf
echo "Include $HOME/.httpd/vhosts/*.conf" >> /etc/apache2/extra/httpd-vhosts.conf


# Add current user to apache group
#dseditgroup -o edit -a $USER -t user _www

apachectl restart

./bin/sphp 56
