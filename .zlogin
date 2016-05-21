#                                                                 -*- shell-script -*-

# .zlogin -> .sh-profile
[[ -e ~/.sh-profile ]] && emulate sh -c 'source ~/.sh-profile'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
