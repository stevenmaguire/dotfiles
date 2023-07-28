# Install Bash 4

# Ask for the administrator password upfront
sudo -v

brew install bash
# change to bash 4
BASHPATH=$(brew --prefix)/bin/bash
if grep -qF "$BASHPATH" /etc/shells;then
    echo "$BASHPATH present in /etc/shells"
else
    echo "$BASHPATH not present in /etc/shells; adding..."
    echo "$BASHPATH" | sudo tee -a /etc/shells
fi
# Change to the new shell
eval "chsh -s $BASHPATH"
echo $BASH_VERSION # should be 4.x not the old 3.2.X

# regular bash-completion package is held back to an older release, so we get latest from versions.
#   github.com/Homebrew/homebrew/blob/master/Library/Formula/bash-completion.rb#L3-L4
brew install bash-completion@2

# generic colouriser  http://kassiopeia.juls.savba.sk/~garabik/software/grc/
brew install grc

# for the c alias (syntax highlighted cat)
sudo easy_install Pygments
