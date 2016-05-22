#                                                                 -*- shell-script -*-

# .zlogin -> .sh-profile
[[ -e ~/.sh-profile ]] && emulate sh -c 'source ~/.sh-profile'

# shell startup files
[ -e ~/.zshrc ] && source ~/.zshrc;

# environment variables
[ -e ~/.sh-env ] && source ~/.sh-env;
