[ -z "$PS1" ] && return

set -a

function append-to-path-var {
    if [ -d "$2" ] && [[ ":$(printenv $1):" != *":$2:"*  ]]; then
        eval "$1=\${$1}:$2"
    fi
}
pathappend() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$PATH:$1"
    fi
}


# ***************
# *             *
# * ENVIRONMENT *
# * VARIABLES   *
# *             *
# ***************

# ------
# PATHS.
# ------

PATH=${PATH%:.}  # remove . from end of $PATH
paths=(
    $HOME/local/bin
    /opt/scripts
    /opt/bin
    /opt/firefox
    /opt/calibre
    /opt
    $HOME/code/scripts
    $HOME/.cabal/bin
    /opt/j64-602/bin
    /opt/j64-701/bin
    /opt/xcape
    /opt/LightTable
    # /opt/node/bin
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
    /opt/nim/bin
    $HOME/.nimble/bin
    /opt/gcolor3/src
    /opt/utorrent-server-v3_0
    $HOME/local/bin
    $HOME/local/bin/node
    $HOME/.cask/bin
    /opt/clean/bin
    /opt/rstudio/bin
    /opt/processing
    /opt/tor-browser
    /opt/helpdeco
    /opt/lfe-master/bin
    /usr/local/texlive/2014/bin/x86_64-linux
    /opt/pdf-diff
    /opt/pdfdir
    /opt/sejda-console/bin
    /opt/jpdfbookmarks
    /opt/info2html
    $HOME/.rvm/bin
    $HOME/.linuxbrew/bin
    $HOME/.fzf
    $HOME/.emacs.d
    $HOME/.scripts
    # /opt/mozart/platform/unknown-unknown
)
for i in "${paths[@]}"; do pathappend "$i" ; done

infopaths=(
    /usr/local/texlive/2014/texmf-dist/doc/info
    $HOME/.linuxbrew/share/info
    /opt/info
)
for i in "${infopaths[@]}"; do append-to-path-var "INFOPATH" "$i" ; done

manpaths=(
    /usr/local/texlive/2014/texmf-dist/doc/man
    $HOME/.linuxbrew/share/man
)
for i in "${manpaths[@]}"; do append-to-path-var "MANPATH" "$i" ; done

cdpaths=(
    $HOME/.cdpath/
    $HOME/ebooks/
    $HOME/Downloads
)
for i in "${cdpaths[@]}"; do append-to-path-var "CDPATH" "$i" ; done

LD_LIBRARY_PATH=/usr/local/lib
CLASSPATH=$CLASSPATH:.
FACTOR_ROOTS=$FACTOR_ROOTS:$HOME/code/factor

# ---------
# LOCATIONS
# ---------

BASHALIASFILE=$HOME/.bash-aliases
GTAGSCONF=/usr/share/doc/global/examples/gtags.conf
VIMPAGER_RC=/opt/vimpager/vimpagerrc
OZHOME=/usr
REDLINE_HOME=/opt/redline
XDG_CONFIG_HOME=$HOME/.config

# ------
# OTHER.
# ------

HISTCONTROL=ignorespace:erasedups
HISTSIZE=2000
HISTFILESIZE=2000
EDITOR=vim
_JAVA_AWT_WM_NONREPARENTING=1; export _JAVA_AWT_WM_NONREPARENTING
LIBOVERLAY_SCROLLBAR=0
SWEAVE_STYLEPATH_DEFAULT="TRUE"


# *****************
# *               *
# * SHELL OPTIONS *
# *               *
# *****************

shopt -q -s dotglob
shopt -q -s extglob
#shopt -q -s failglob
shopt -q -s globstar
shopt -q -s histappend
shopt -q -s histreedit
shopt -q -s histverify
shopt -q -s lithist
#shopt -q -s nullglob  # prevents eg, find . -iname *string* without quotes


# *********
# *       *
# * INPUT *
# *       *
# *********

# ---KEY REPEAT---
xset r rate 250 50  # X key repeat: xset r rate <ms delay> <char per sec>
#kbdrate -r 50 -d 250  # console key repeat: kbdrate -r <cps> -d <ms>


#---KEY REBINDING---
#if [ -f ~/.Xmodmap ]; then xmodmap ~/.Xmodmap; fi
#xmodmap -e "keycode 115 = Super_L" -e "add mod4 = Super_L" # -> .Xmodmap
# setxkbmap -option "ctrl:swapcaps"

# fix End key (mapped to SuperL for unknown reason)
xmodmap -e "keycode 115 = End NoSymbol End"

# #---xinput---
# # swap middle-button(2) and thumb1 (8)
# MOUSE_ID=`xinput list | grep -i STORM\ SENTINEL | head -n 1 -`
# MOUSE_ID=${MOUSE_ID##*=}; MOUSE_ID=${MOUSE_ID%%[*}
# #xinput set-button-map $MOUSE_ID 1 8 3 4 5 6 7 2 9
# #xinput set-button-map $MOUSE_ID 1 2 3 4 5 6 7 2 8
# xinput set-button-map $MOUSE_ID 1 2 3 4 5 6 7 2 2


# *******
# *     *
# * GIT *
# *     *
# *******
git config --global core.excludesfile ~/.gitignore_global
# https://coderwall.com/p/euwpig/a-better-git-log
git config --global core.pager 'less -+F -RSX'
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.filestoadd "diff --stat"
git config --global alias.changestoadd "diff"
git config --global alias.filestocommit "status"
git config --global alias.changestocommit "diff --cached"
git config --global alias.filestopush "diff --stat HEAD origin/master"
git config --global alias.changestopush "diff HEAD origin/master"

# **********
# *        *
# * PYTHON *
# *        *
# **********
PYTHONPATH=$PYTHONPATH:/opt/phpsh/lib/python2.7/site-packages
PYTHONPATH=$PYTHONPATH:/usr/share/sip
# warning: this can break system python programs - the dirs are
#          added near the start of the pythonpath
#PYTHONPATH=$PYTHONPATH:/usr/share/pyshared:$HOME/code/python
#PYTHONPATH=$PYTHONPATH:/usr/share/pyshared


# ***********
# *         *
# * CLOJURE *
# *         *
# ***********
CLOJURE_EXT=~/.clojure
pathappend "/opt/clojure-contrib/launchers/bash"
alias clj=clj-env-dir


# ********
# *      *
# * MISC *
# *      *
# ********

# ---bashmarks---
if [ -f /opt/scripts/bashmarks.sh ]; then source /opt/scripts/bashmarks.sh; fi

# ---enable color support of ls---
# if [ -x /usr/bin/dircolors ]; then test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)" fi

# ---run xcape---
# if ! pgrep xcape >/dev/null; then xcape & fi 
if pgrep xcape >/dev/null; then pkill xcape; fi
xcape & 

# ---ULIMIT---
#ulimit -c unlimited

#  -------- 
#  bindings 
#  -------- 
bind -x '"\C-x\C-m": "xmodmap $HOME/.Xmodmap"'

# -------------
#  vi bindings
# -------------
# bindkey -v
# bindkey -M viins 'jj' vi-cmd-mode
# bindkey '^R' history-incremental-search-backward



# ********************
# *                  *
# * LOAD OTHER FILES *
# *                  *
# ********************

#if [ -f /etc/profile ]; then . /etc/profile; fi
if [ -f ~/.bash-aliases ]; then . ~/.bash-aliases; fi
if [ -f ~/.bash-prompt ]; then . ~/.bash-prompt; fi
if [ -f ~/.bash-functions ]; then . ~/.bash-functions; fi
if [ -f ~/.rvm/scripts/rvm ]; then . ~/.rvm/scripts/rvm; fi
if [ -f /etc/profile.d/bash_completion.sh ]; then . /etc/profile.d/bash_completion.sh; fi


# *************
# *           *
# * FUNCTIONS *
# *           *
# *************


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


# ----------------------------------------------------------------------------

set +a

echo ".bashrc done"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
