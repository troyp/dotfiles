set -a
LD_LIBRARY_PATH=/usr/local/lib

pathappend() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$PATH:$1"
    fi
}
PATH=${PATH%:.}  # remove . from end of $PATH
paths=(
    $HOME/local/bin
    /opt/scripts
    /opt/bin
    /opt/firefox
    /opt
    $HOME/code/scripts
    $HOME/.cabal/bin
    /opt/j64-602/bin
    /opt/j64-701/bin
    /opt/xcape
    /opt/LightTable
    ${SCALA_HOME:-/opt/scala}/bin
    /opt/sbt/bin
    /opt/mozart2/bin
    /opt/racket/bin
    /opt/leiningen
    $HOME/.lein/bin
    /opt/eclipse
    /opt/smlnj/bin
    /var/lib/gems/1.8/bin
    /opt/google_appengine/
    /opt/xulrunner
    /opt/Amber/bin
    /opt/redline
    /opt/epub2pdf
    /opt/Nimrod/bin
    /opt/gcolor3/src
    /opt/utorrent-server-v3_0
    $HOME/local/bin
    $HOME/local/bin/node
    $HOME/.cask/bin
    /opt/clean/bin
    /opt/clean/rstudio
    /opt/tor-browser
    /usr/local/texlive/2013/bin/x86_64-linux
)
for i in "${paths[@]}"; do pathappend "$i" ; done
# pathappend "/opt/mozart/platform/unknown-unknown"

alias gprolog='/usr/local/bin/gprolog'
CLASSPATH=$CLASSPATH:.
# OZHOME=/opt/mozart2
OZHOME=/usr
FACTOR_ROOTS=$FACTOR_ROOTS:$HOME/code/factor
XDG_CONFIG_HOME=$HOME/.config
CDPATH=.:$HOME/.cdpath/:$HOME/ebooks/:$HOME/Downloads
REDLINE_HOME=/opt/redline
HISTCONTROL=ignorespace:erasedups
HISTSIZE=2000
HISTFILESIZE=2000
#PAGER=vimpager
#MANPAGER=vimpager
EDITOR=vim
UWHPSC='$HOME/Documents/hpsc-course/uwhpsc'
#OZEMACS="z:\\programs\\XEmacs\\XEmacs-21.4.22\\i586-pc-win32\\xemacs.exe"
_JAVA_AWT_WM_NONREPARENTING=1; export _JAVA_AWT_WM_NONREPARENTING
LIBOVERLAY_SCROLLBAR=0
GTAGSCONF=/usr/share/doc/global/examples/gtags.conf
VIMPAGER_RC=/opt/vimpager/vimpagerrc
SWEAVE_STYLEPATH_DEFAULT="TRUE"


# ---SHELL OPTIONS---
shopt -q -s dotglob
shopt -q -s extglob
#shopt -q -s failglob
shopt -q -s globstar
shopt -q -s histappend
shopt -q -s histreedit
shopt -q -s histverify
shopt -q -s lithist
#shopt -q -s nullglob  # prevents eg, find . -iname *string* without quotes

# ---ULIMIT---
#ulimit -c unlimited

# ---KEY REPEAT---
xset r rate 250 50  # X key repeat: xset r rate <ms delay> <char per sec>
#kbdrate -r 50 -d 250  # console key repeat: kbdrate -r <cps> -d <ms>

# ---LOAD OTHER FILES---
#if [ -f /etc/profile ]; then . /etc/profile; fi
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi
if [ -f ~/.bash_prompt ]; then . ~/.bash_prompt; fi


# if [ -f /bin/config.sh ]; then . ~/algs4/bin/config.sh; fi

#---KEY REBINDING---
#if [ -f ~/.Xmodmap ]; then xmodmap ~/.Xmodmap; fi
#xmodmap -e "keycode 115 = Super_L" -e "add mod4 = Super_L" # -> .Xmodmap
setxkbmap -option "ctrl:swapcaps"

# #---xinput---
# # swap middle-button(2) and thumb1 (8)
# MOUSE_ID=`xinput list | grep -i STORM\ SENTINEL | head -n 1 -`
# MOUSE_ID=${MOUSE_ID##*=}; MOUSE_ID=${MOUSE_ID%%[*}
# #xinput set-button-map $MOUSE_ID 1 8 3 4 5 6 7 2 9
# #xinput set-button-map $MOUSE_ID 1 2 3 4 5 6 7 2 8
# xinput set-button-map $MOUSE_ID 1 2 3 4 5 6 7 2 2

# ---git---
git config --global core.excludesfile ~/.gitignore_global

# ---python---
PYTHONPATH=$PYTHONPATH:/opt/phpsh/lib/python2.7/site-packages
PYTHONPATH=$PYTHONPATH:/usr/share/sip
# warning: this can break system python programs - the dirs are
#          added near the start of the pythonpath
#PYTHONPATH=$PYTHONPATH:/usr/share/pyshared:$HOME/code/python
#PYTHONPATH=$PYTHONPATH:/usr/share/pyshared

# ---clojure---
CLOJURE_EXT=~/.clojure
pathappend "/opt/clojure-contrib/launchers/bash"
alias clj=clj-env-dir

# ---bashmarks---
if [ -f /opt/scripts/bashmarks.sh ]; then source /opt/scripts/bashmarks.sh; fi

# ---run xcape---
if ! pgrep xcape >/dev/null; then xcape & fi 

# ---------------

bind -x '"\C-x\C-m": "xmodmap $HOME/.Xmodmap"'

function cnd {
    mkdir "$1"
    cd "$1"
}

function lsd {
    base=${1%/}
    ls -d "$base"/*/
}

function pe { $( echo "printenv ${1^^}" ); }

function col {
    awk -- "{print \$$1}";
}
set +a

echo ".bashrc done"

# --------------
# # vi bindings.
# #-------------
# bindkey -v
# bindkey -M viins 'jj' vi-cmd-mode
# bindkey '^R' history-incremental-search-backward
