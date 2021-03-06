# initial paths
base_path_parts=('/usr/local/bin' '/usr/local/sbin' '~/bin' '/usr/bin' '/bin' '/usr/sbin' '/sbin')
export PATH=$(IFS=: ; echo "${base_path_parts[*]}")
unset base_path_parts

# include mysql-client only binaries
export PATH=/usr/local/opt/mysql-client/bin:$PATH

# homebrew basics
export PATH=$(brew --prefix)/bin:$(brew --prefix)/sbin:$PATH

# Composer binaries
export PATH=~/.composer/vendor/bin:$PATH

# Python binaries
export PATH=$(python -m site --user-base)/bin:$PATH

# Ruby env
# export RBENV_ROOT="$(brew --prefix)/var/rbenv"
eval "$(rbenv init -)"
export PATH="$(brew --prefix)/.rbenv/bin:$PATH"

# GPG Config
# https://github.com/keybase/keybase-issues/issues/2798
export GPG_TTY=$(tty)

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
## gotta tune that bash_history…
##

# timestamps for later analysis. www.debian-administration.org/users/rossen/weblog/1
export HISTTIMEFORMAT='%F %T '

# keep history up to date, across sessions, in realtime
#  http://unix.stackexchange.com/a/48113
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history (default is 500)
export HISTFILESIZE=$HISTSIZE            # big big history
shopt -s histappend;                     # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# ^ the only downside with this is [up] on the readline will go over all history not just this bash session.


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

##
## hooking in other apps…
##
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

#--------------------------------------
# Cleanup PATH to remove duplicates
#--------------------------------------
# export PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"
