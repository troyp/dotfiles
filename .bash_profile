#                                                                 -*- shell-script -*-

# if running bash, source .bashrc
[[ -n "$BASH_VERSION" && -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"

# .bash_profile -> .sh-profile
[ -e ~/.sh-profile ] && source ~/.sh-profile

# fzf (https://github.com/junegunn/fzf)
[ -e ~/.fzf.bash ] && source ~/.fzf.bash

# .vim.ana configurations #
[ -e ~/.bash_vim_append ] && source ~/.bash_vim_append

# environment variables
[ -e ~/.sh-env ] && source ~/.sh-env;

[ -e ~/.sh-profile ] && source ~/.sh-profile;

# -------------------------------------------------------------------------------

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
