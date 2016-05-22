#                                                                 -*- shell-script -*-

# .bash_profile -> .sh-profile
[ -e ~/.sh-profile ] && source ~/.sh-profile

# if running bash, source .bashrc
[[ -n "$BASH_VERSION" && -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"

# environment variables
[ -e ~/.sh-env ] && source ~/.sh-env;

# fzf (https://github.com/junegunn/fzf)
[ -e ~/.fzf.bash ] && source ~/.fzf.bash

# .vim.ana configurations #
[ -e ~/.bash_vim_append ] && source ~/.bash_vim_append

# -------------------------------------------------------------------------------
