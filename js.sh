
# This installs `npm` too using the recommended installation method
brew install node

# Make a directory for global installations:
mkdir ~/.npm-global

# Configure npm to use the new directory path:
npm config set prefix '~/.npm-global'

#------------------------------
# Install gulp globally
#------------------------------
npm install -g gulp bower
