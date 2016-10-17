#                                                                 -*- shell-script -*-
[[ ! -z $DEBUG  ]] && echo "sourcing .zshenv"

# environment variables
# .zshenv -> .sh-env
[ -e ~/.sh-env ] && source ~/.sh-env;

# # PYENV setup
# [[ -f ~/.zshenv-pyenv ]] && source ~/.zshenv-pyenv
