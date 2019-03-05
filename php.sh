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

##
# Homebrew's policy seems to suggest that once an upstream package is EOL
# it will no longer support it. Just is the case with PHP 5.6 and 7.0. Some
# generous soul has offered to keep EOL formulae alive via a new tap...
# https://github.com/Homebrew/homebrew-core/pull/35679#issuecomment-452086030
brew tap exolnet/homebrew-deprecated

brew install brew-php-switcher
brew install jq

##
# You can use this JSON string to define php versions and PECL packages
# that should be installed for each:
#   {"version": "5.6", "packages": ["xdebug-2.5.5"]},
#   {"version": "7.0", "packages": ["xdebug","apcu-5.1.17"]},
declare -r php_version_json='[
    {"version": "5.6", "packages": []},
    {"version": "7.0", "packages": []},
    {"version": "7.1", "packages": []},
    {"version": "7.2", "packages": []},
    {"version": "7.3", "packages": ["xdebug-beta","apcu-5.1.17"]}
]'

#------------------------------
# Install PHP Versions
#------------------------------
echo ${php_version_json} | jq -c '.[]' | while read php; do
    version=$(echo ${php} | jq -r '.version')

    echo "Installing PHP Version $version"

    $(brew install php@$version)
    # We will want to update the PHP INI config file to include
    # our current timezone to avoid any issues running locally.
    sudo gsed -i "s|;date.timezone =|date.timezone = \"$(gettimezone)\"|g" "$(brew --prefix)/etc/php/$version/php.ini"
done

#------------------------------
# Install PHP Packages
#------------------------------
# - check the php.ini, that you not have xdebug.so for the
#   values extension= and zend_extension=.
echo ${php_version_json} | jq -c '.[]' | while read php; do
    version=$(echo ${php} | jq -r '.version')
    packages=$(echo ${php} | jq -r '.packages')

    echo "Installing PHP Packages for Version $version"

    brew-php-switcher ${version}

    echo ${packages} | jq -r '.[]' | while read package; do
        echo "Installing PHP Pacakage $package"
        pecl install ${package}
    done

    # Let's remove duplicate directives from version specific php.ini
    awk '!seen[$0]++' "$(brew --prefix)/etc/php/$version/php.ini" > tmp && mv tmp "$(brew --prefix)/etc/php/$version/php.ini"
done

#------------------------------
# Use PHP 7.1
#------------------------------
brew-php-switcher 7.1

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

