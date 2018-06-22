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
brew tap homebrew/core

brew install brew-php-switcher
brew install jq

declare -r php_version_json='[
    {"version": "5.6", "packages": ["xdebug-2.5.5","apcu-4.0.8"]},
    {"version": "7.0", "packages": ["xdebug","apcu-5.1.11"]},
    {"version": "7.1", "packages": ["xdebug","apcu-5.1.11"]},
    {"version": "7.2", "packages": ["xdebug","apcu-5.1.11"]}
]'

#------------------------------
# Install PHP Versions
#------------------------------
echo ${php_version_json} | jq -c '.[]' | while read php; do
    version=$(echo ${php} | jq -r '.version')

    echo "Installing PHP Version $version"

    $(brew install php@$version)
    sudo sed -i "s|;date.timezone =|date.timezone = \"$(gettimezone)\"|g" "$(brew --prefix)/etc/php/$version/php.ini"
done

#------------------------------
# Install PHP Packages
#------------------------------
echo ${php_version_json} | jq -c '.[]' | while read php; do
    version=$(echo ${php} | jq -r '.version')
    packages=$(echo ${php} | jq -r '.packages')

    brew-php-switcher ${version}

    echo "Installing PHP Packages for Version $version"

    echo ${packages} | jq -r '.[]' | while read package; do
        echo "Installing PHP Pacakage $package"
        pecl install ${package}
    done
done

#------------------------------
# Use PHP 7.0
#------------------------------
brew-php-switcher 7.0

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

