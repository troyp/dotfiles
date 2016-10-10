# PYENV
# see https://github.com/yyuu/pyenv

# for pyenv: call pyenv-prepend-to-path
# for pyenv-virtualenv: call pyenv-virtualenv-enable-autoactivation

# where to call setup functions:
    # ZSH:  .zshrc
    # BASH: (ubuntu) .bashrc
    #       (other)  .bash_profile

export PYENV_ROOT="$HOME/.pyenv"

pyenv-prepend-to-path () {
    dir="$PYENV_ROOT/bin"
    if [[ -d "$dir" ]]; then
        if [[ "$PATH:" =~ "^$dir:" ]]; then
            echo "$dir is already in the PATH"
        else
            PATH="$dir:$PATH"
        fi
    else
        echo "directory $dir not found"
    fi
}

pyenv-virtualenv-enable-autoactivation () {
    eval "$(pyenv virtualenv-init -)"
}
