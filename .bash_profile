#                                                                 -*- shell-script -*-
[[ ! -z $DEBUG  ]] && echo "sourcing .bash_profile"

# load .profile
[ -e ~/.profile ] && source ~/.profile

# -------------------------------------------------------------------------------

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
