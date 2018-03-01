
# This installs `npm` too using the recommended installation method
brew install node

# Make a directory for global installations:
mkdir ~/.npm-global

# Configure npm to use the new directory path:
export NPM_CONFIG_PREFIX=~/.npm-global

#------------------------------
# Install gulp & bower globally
#------------------------------
sudo chown -R $(whoami) ~/.cache
sudo chown -R $(whoami) ~/.config
npm install -g gulp bower
