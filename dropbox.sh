# Symlinking all the things
mkdir -p $HOME"/.ssh"
ln -sf $HOME"/Dropbox/Stevil/ssh/id_rsa" $HOME"/.ssh/id_rsa"
ln -sf $HOME"/Dropbox/Stevil/ssh/id_rsa.pub" $HOME"/.ssh/id_rsa.pub"
ln -sf $HOME"/Dropbox/Stevil/ssh/favorites/sequel-pro-favorites.plist" $HOME"/Library/Application Support/Sequel Pro/Data/Favorites.plist"

chmod 400 $HOME"/.ssh/id_rsa"
chmod 400 $HOME"/.ssh/id_rsa.pub"
