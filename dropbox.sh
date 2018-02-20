##################################################
# Symlinking all the things
##################################################z

# ssh keys
mkdir -p $HOME"/.ssh"
ln -sf $HOME"/Dropbox/Stevil/ssh/id_rsa" $HOME"/.ssh/id_rsa"
ln -sf $HOME"/Dropbox/Stevil/ssh/id_rsa.pub" $HOME"/.ssh/id_rsa.pub"

# Sequel Pro
rm -rf $HOME"/Library/Application Support/Sequel Pro/Data/Favorites.plist"
ln -sf $HOME"/Dropbox/Stevil/ssh/favorites/sequel-pro-favorites.plist" $HOME"/Library/Application Support/Sequel Pro/Data/Favorites.plist"

# Sublime Text
rm -rf $HOME"/Library/Application Support/Sublime Text 3/Installed Packages"
ln -sf $HOME"/Dropbox/Stevil/Workbench/sublime-text-3/Installed Packages" $HOME"/Library/Application Support/Sublime Text 3"
rm -rf $HOME"/Library/Application Support/Sublime Text 3/Packages"
ln -sf $HOME"/Dropbox/Stevil/Workbench/sublime-text-3/Packages" $HOME"/Library/Application Support/Sublime Text 3"
