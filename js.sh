
# This installs `npm` too using the recommended installation method
brew install node

# Make a directory for global installations:
mkdir ~/.npm-global

# Configure npm to use the new directory path:
export NPM_CONFIG_PREFIX=~/.npm-global

#------------------------------
# Install gulp globally
#------------------------------
npm install -g gulp bower
