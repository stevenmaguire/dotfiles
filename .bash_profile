# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

# generic colouriser
GRC=`which grc`
if [ "$TERM" != dumb ] && [ -n "$GRC" ]
    then
        alias colourify="$GRC -es --colour=auto"
        alias configure='colourify ./configure'
        for app in {diff,make,gcc,g++,mtr,ping,traceroute}; do
            alias "$app"='colourify '$app
        done
fi

##
## Completion…
##

# bash completion.
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
    . "$(brew --prefix)/share/bash-completion/bash_completion";
fi

if which brew > /dev/null && [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults


##
## better `cd`'ing
##

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# z beats cd most of the time.
if which brew > /dev/null && [ -f "$(brew --prefix)/etc/profile.d/z.sh" ]; then
    . "$(brew --prefix)/etc/profile.d/z.sh";
fi

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/steven/.cache/lm-studio/bin"


# Herd injected PHP 8.1 configuration.
export HERD_PHP_81_INI_SCAN_DIR="/Users/steven/Library/Application Support/Herd/config/php/81/"


# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/steven/Library/Application Support/Herd/config/php/82/"


# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/steven/Library/Application Support/Herd/config/php/83/"


# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/steven/Library/Application Support/Herd/config/php/84/"


# Herd injected PHP binary.
export PATH="/Users/steven/Library/Application Support/Herd/bin/":$PATH


# Herd injected PHP 8.0 configuration.
export HERD_PHP_80_INI_SCAN_DIR="/Users/steven/Library/Application Support/Herd/config/php/80/"


# Herd injected PHP 7.4 configuration.
export HERD_PHP_74_INI_SCAN_DIR="/Users/steven/Library/Application Support/Herd/config/php/74/"


# Herd injected PHP binary.
export PATH="/Users/steven/Library/Application Support/Herd/bin/":$PATH


# Herd injected PHP binary.
export PATH="/Users/steven/Library/Application Support/Herd/bin/":$PATH


# Herd injected PHP binary.
export PATH="/Users/steven/Library/Application Support/Herd/bin/":$PATH


# Herd injected PHP binary.
export PATH="/Users/steven/Library/Application Support/Herd/bin/":$PATH
