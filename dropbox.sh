##################################################
# Symlinking all the things
##################################################z

# ssh keys
mkdir -p $HOME"/.ssh"
ln -sf $HOME"/Dropbox/Stevil/ssh/id_rsa" $HOME"/.ssh/id_rsa"
ln -sf $HOME"/Dropbox/Stevil/ssh/id_rsa.pub" $HOME"/.ssh/id_rsa.pub"

# Sequel Pro
ln -sf $HOME"/Dropbox/Stevil/ssh/favorites/sequel-pro-favorites.plist" $HOME"/Library/Application Support/Sequel Pro/Data/Favorites.plist"

# Transmit
# ln -sf $HOME"/Dropbox/Stevil/ssh/favorites/transmit.sqlite" $HOME"/Library/Application Support/Transmit/Favorites/Favorites.sqlite"
# ln -sf $HOME"/Dropbox/Stevil/ssh/favorites/transmit.xml" $HOME"/Library/Application Support/Transmit/Favorites/Favorites.xml"

# Sublime Text
rm -rf $HOME"/Library/Application Support/Sublime Text 3/Installed Packages"
ln -sf $HOME"/Dropbox/Stevil/Workbench/sublime-text-3/Installed Packages" $HOME"/Library/Application Support/Sublime Text 3"
rm -rf $HOME"/Library/Application Support/Sublime Text 3/Packages"
ln -sf $HOME"/Dropbox/Stevil/Workbench/sublime-text-3/Packages" $HOME"/Library/Application Support/Sublime Text 3"