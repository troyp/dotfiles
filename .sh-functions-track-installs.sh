pipi2 () {
    name="$1";
    shift;
    sudo -H pip install "$*" "$name" && grep -qF "$name" || echo "$name" >> $HOME/.pip_installs
}

pipi3 () {
    sudo -H pip3 install "$*" "$name" && grep -qF "$name" || echo "$name" >> $HOME/.pip3_installs
}

alias pipi=pipi2

npmi () {
    npm install -g "$@" && echo "$@" >> $HOME/.npm_installs
}

gemi () {
    for x in "$@"; do
        gem install "$x" && grep -qF "$1" || echo "$x" >> $HOME/.gem_installs
    done
}

sgemi () {
    sudo gem install "$1" && grep -qF "$1" || echo "$1" >> $HOME/.gem_installs
}

cpanmi () {
    options="";
    while [[ $1 =~ ^- ]]; do
        case "$1" in
          *) options+=" $1"
             ;;
        esac
        shift
    done
    for name in $@; do
        sudo cpanm "$name" && grep -qF "$1" || echo "$name" >> $HOME/.cpan_installs;
    done
}

cabali () {
    cabal update || exit 1
    for name in $@; do
        cabal install "$name" && grep -qF "$1" || echo "$name" >> $HOME/.cabal_installs;
    done
}

raci () {
raco pkg install "$1" && grep -qF "$1" || echo "$1" >> $HOME/.raco_installs
}

opami () {
    for name in $@; do
        opam install "$name" && grep -qF "$1" || echo "$name" >> $HOME/.opam_installs;
    done
}
