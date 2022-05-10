#------------------------------
# Let's set up Sublime Text
#------------------------------

if [ -f /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ]; then
    /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl --command exit
fi

if [ ! -d ~/.sublime-settings ]; then
    echo "clone that thing!"
    git clone git@github.com:stevenmaguire/sublime-settings.git ~/.sublime-settings
fi

if [ -d ~/Library/Application\ Support/Sublime\ Text ]; then
    echo "delete application support"
    rm -rf ~/Library/Application\ Support/Sublime\ Text
fi

echo "make symlink"
ln -sf  ~/.sublime-settings ~/Library/Application\ Support/Sublime\ Text
