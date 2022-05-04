#------------------------------
# PHP
#------------------------------
brew install php

#------------------------------
# Install composer, and two tools (assuming the symlinks haven't run yet)
#------------------------------
brew install composer
composer global require laravel/installer
composer global require laravel/valet
