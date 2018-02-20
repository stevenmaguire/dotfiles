# copy paste this file in bit by bit.
# don't run it.
  echo "do not run this script in one go. hit ctrl-c NOW"
  read -n 1

# read migration.md where more migrationy tips are!

# homebrew!
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Xcode!
# Download Xcode and command line tools via App Store
xcode-select --install

# install all the things
./brew.sh
./brew-cask.sh

# Create code home
mkdir -p $HOME/Projects
sudo chown -R $(whoami) $HOME/Projects

# PHP, MySQL, Apache!
./lamp.sh

# Ruby and rails
./ruby.sh

# Go
./go.sh

# Dotnet
./dotnet.sh

# Elastic Search
./elasticsearch.sh

# Dropbox symlinks
./dropbox.sh

# https://github.com/jamiew/git-friendly
# the `push` command which copies the github compare URL to my clipboard is heaven
bash < <( curl https://raw.github.com/jamiew/git-friendly/master/install.sh)

# Type git open to open the GitHub page or website for a repository.
npm install -g git-open

# https://github.com/rupa/z
  # z, oh how i love you
cd ~/code
git clone https://github.com/rupa/z.git
chmod +x ~/code/z/z.sh
# also consider moving over your current .z file if possible. it's painful to rebuild :)

  # z binary is already referenced from .bash_profile

# https://github.com/thebitguru/play-button-itunes-patch
# disable itunes opening on media keys
cd ~/code
git clone https://github.com/thebitguru/play-button-itunes-patch

# my magic photobooth symlink -> dropbox. I love it.
# + first move Photo Booth folder out of Pictures
# + then start Photo Booth. It'll ask where to put the library.
# + put it in Dropbox/public
# * now you can record photobooth videos quickly and they upload to dropbox DURING RECORDING
# * then you grab public URL and send off your video message in a heartbeat.

# for the c alias (syntax highlighted cat)
sudo easy_install Pygments

# change to bash 4 (installed by homebrew)
BASHPATH=$(brew --prefix)/bin/bash
echo $BASHPATH | sudo tee -a /etc/shells
  # will set for current user only.
echo $BASH_VERSION # should be 4.x not the old 3.2.X

# Later, confirm iterm settings aren't conflicting.

# symlinks!
#   put/move git credentials into ~/.gitconfig.local
#   http://stackoverflow.com/a/13615531/89484
./symlink-setup.sh

