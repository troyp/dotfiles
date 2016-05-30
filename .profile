#                                                                 -*- shell-script -*-
[[ ! -z $DEBUG  ]] && echo "sourcing .profile"

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022


# if running bash, source .bashrc
if [[ -n "$BASH_VERSION"]]; then
        [[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"
        [[ -f "$HOME/.bashenv" ]] && . "$HOME/.bashenv"
fi

# .profile -> .sh-profile
[ -e ~/.sh-profile ] && source ~/.sh-profile

# fzf (https://github.com/junegunn/fzf)
[ -e ~/.fzf.bash ] && source ~/.fzf.bash

# .vim.ana configurations #
[ -e ~/.bash_vim_append ] && source ~/.bash_vim_append


# -------------------------------------------------------------------------------

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
