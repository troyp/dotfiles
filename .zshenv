#                                                                 -*- shell-script -*-
[[ ! -z $DEBUG  ]] && echo "sourcing .zshenv"

# environment variables
# .zshenv -> .sh-env
[ -e ~/.sh-env ] && source ~/.sh-env;
