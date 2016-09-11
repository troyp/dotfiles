#                                                                 -*- shell-script -*-
[[ ! -z $DEBUG  ]] && echo "sourcing .zlogin"

# .zlogin -> .sh-profile
# [[ -e ~/.sh-profile ]] && emulate sh -c 'source ~/.sh-profile'
[[ -e ~/.sh-profile ]] && source ~/.sh-profile

# shell startup files
[[ -e ~/.zshrc ]] && source ~/.zshrc;

# environment variables
[[ -e ~/.sh-env ]] && source ~/.sh-env;

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
