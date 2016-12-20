#                                                                 -*- shell-script -*-
[[ ! -z $DEBUG  ]] && echo "sourcing .zshenv"

# # null_glob option needed for .sh-env
# setopt null_glob

# environment variables
# .zshenv -> .sh-env
[ -e ~/.sh-env ] && source ~/.sh-env;

# # PYENV setup
# [[ -f ~/.zshenv-pyenv ]] && source ~/.zshenv-pyenv
