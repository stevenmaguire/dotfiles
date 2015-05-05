# Install and configure php, apache, mysql using Homebrew

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

## http://getgrav.org/blog/mac-os-x-apache-setup-multiple-php-versions

# Make projects directory and structure
WEB_ROOT='$HOME/Projects/php/apps'
mkdir -p $WEB_ROOT

# Install PHP
brew tap homebrew/homebrew-php
brew install php54
brew install php55
brew install php56

# Remove outdated versions from the cellar
brew cleanup

# Update http conf
if [ ! -f /etc/apache2/httpd.conf.default ]; then
    curl -o /etc/apache2/httpd.conf.default https://raw.githubusercontent.com/stevenmaguire/apache2-conf-osx/master/http.conf.default
fi

cp /etc/apache2/httpd.conf.default /etc/apache2/httpd.conf

sed -i ".original" "s|/Library/WebServer/Documents|$WEB_ROOT|g" /etc/apache2/httpd.conf
sed -i ".original" "s|#LoadModule php5_module libexec/apache2/libphp5//.so|LoadModule php5_module /usr/local/lib/libphp5//.so|g" /etc/apache2/httpd.conf

apachectl restart

./bin/sphp 56

echo "Done configuring L(M)AMP."
