# PYENV
# see https://github.com/yyuu/pyenv

# ZSH:  source from .zshrc
# BASH: (ubuntu) source from .bashrc
#       (other)  source from .bash_profile

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
