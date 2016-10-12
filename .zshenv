#                                                                 -*- shell-script -*-
[[ ! -z $DEBUG  ]] && echo "sourcing .zshenv"

# environment variables
# .zshenv -> .sh-env
[ -e ~/.sh-env ] && source ~/.sh-env;

# -------------------------------------------------------------------------------
# ,-------,
# | PYENV |
# '-------'

# PYENV setup functions and variable
if [[ -e ~/.pyenv_load_setup_functions.sh ]]; then
    source ~/.pyenv_load_setup_functions.sh
    pyenv-prepend-to-path
else
    echo "Can't find ~/.pyenv_load_setup_functions.sh"
fi
# OPTIONAL: pyenv-virtualenv autoactivation of virtualenvs
if pyenv commands | grep virtualenv-init >/dev/null; then
    # diable prompt setting: can be removed in future pyenv-virtualenv release
    PYENV_VIRTUALENV_DISABLE_PROMPT=1
    # pyenv-virtualenv setup
    eval "$(pyenv virtualenv-init -)"
else
    echo "pyenv virtualenv-init command not available: install pyenv-virtualenv"
fi
