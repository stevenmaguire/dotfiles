# This installs `npm` too using the recommended installation method
volta install node

# @todo Determine if volta needs any of this
#
# # Make a directory for global installations:
# mkdir ~/.npm-global

# # Configure npm to use the new directory path:
# export NPM_CONFIG_PREFIX=~/.npm-global

# # Make sure I am the owner of these config directories used by package managers
# mkdir ~/.cache
# mkdir ~/.config
# sudo chown -R $(whoami) ~/.cache
# sudo chown -R $(whoami) ~/.config
