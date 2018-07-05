
# This installs `npm` too using the recommended installation method
brew install node

# Make a directory for global installations:
mkdir ~/.npm-global

# Configure npm to use the new directory path:
export NPM_CONFIG_PREFIX=~/.npm-global

# Make sure I am the owner of these config directories used by package managers
touch ~/.cache
touch ~/.config
sudo chown -R $(whoami) ~/.cache
sudo chown -R $(whoami) ~/.config
