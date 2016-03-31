#                                                                 -*- shell-script -*-

set -a

# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# .vim.ana configurations #
source ~/.bash_vim_append

# ---run ibus-daemon---
IBUS_ENABLE_SYNC_MODE=1 ibus-daemon -xrd


# ---------------------------
#  PATH appending functions.
# ---------------------------
# note: If the path-var is initially empty, the first directory added will be
# appended after the empty string.
# Hence the path-var will begin with separator ":"

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

# ---------
# LOCATIONS
# ---------

BASH_ALIAS_FILE=$HOME/.bash-aliases
BASH_FUNCTION_FILE=$HOME/.bash-functions
SCRIPTS_DIRECTORY=$HOME/.scripts
GTAGSCONF=/usr/share/doc/global/examples/gtags.conf
VIMPAGER_RC=/opt/vimpager/vimpagerrc
SUDO_ASKPASS=/usr/bin/gksu
OZHOME=/usr
REDLINE_HOME=/opt/redline
XDG_CONFIG_HOME=$HOME/.config
ANDROID_HOME='/home/troy/Android/Sdk'
ANDROID_SDK_HOME='/home/troy/Android/Sdk'
GOPATH=$HOME/gowork
JHOME=/opt/j64-804
KDE_PLACES_FILE='/home/troy/.local/share/user-places.xbel'
KDE_BOOKMARKS_FILE='/home/troy/.kde/share/apps/kfile/bookmarks.xml'

# ------
# PATHS.
# ------

PATH=${PATH%:.}  # remove . from end of $PATH
paths=(
    $HOME/local/bin
    $HOME/local/bin/node
    $HOME/.rvm/bin
    $HOME/.linuxbrew/bin
    $HOME/.fzf
    $HOME/.emacs.d
    $HOME/.scripts
    $HOME/.cabal/bin
    $HOME/.nimble/bin
    $HOME/.cask/bin
    $HOME/.lein/bin
	  $HOME/gowork/bin
    $HOME/code/working
    $HOME/code/scripts
    $ANDROID_HOME/tools
    $ANDROID_HOME/platform-tools
    ${SCALA_HOME:-/opt/scala}/bin
	  $JHOME/bin
    # /opt/mozart/platform/unknown-unknown
    # /opt/node/bin
    /opt
    /opt/bin
    /opt/scripts
    /opt/firefox
    /opt/calibre
    /opt/xcape
    /opt/LightTable
    /opt/sbt/bin
    /opt/mozart2/bin
    /opt/racket/bin
    /opt/leiningen
    /opt/eclipse
    /opt/smlnj/bin
    /var/lib/gems/1.8/bin
    /opt/google_appengine/
    /opt/xulrunner
    /opt/Amber/bin
    /opt/redline
    /opt/epub2pdf
    /opt/nim/bin
    /opt/gcolor3/src
    /opt/utorrent-server-v3_0
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
    /opt/SublimeText2
    /opt/peazip
    /opt/peazip/res
    /opt/lilyterm/bin
    /opt/phantomjs-2.0.0/bin
	  /opt/icon/bin
	  /opt/pdfsandich
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
    $HOME/.linuxbrew/share/man/
    /opt/man/
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


# --------
# HISTORY.
# --------
HISTCONTROL=ignorespace:ignoredups:erasedups
HISTFILESIZE=100000
HISTSIZE=100000
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
# history-refresh function (in ~/.bash-functions): refreshes history (brings
# in commands that have been typed in other shells since the shell started)
shopt -q -s cmdhist
shopt -q -s histappend
shopt -q -s histreedit
shopt -q -s histverify
shopt -q -s lithist

# ------
# OTHER.
# ------

MANPAGER=less
EDITOR=vim
_JAVA_AWT_WM_NONREPARENTING=1; export _JAVA_AWT_WM_NONREPARENTING
LIBOVERLAY_SCROLLBAR=0
SWEAVE_STYLEPATH_DEFAULT="TRUE"


# *****************
# *               *
# * SHELL OPTIONS *
# *   (other)     *
# *               *
# *****************

# extdebug option causes error in Spacemacs - bash: _Dbg_filenames[$fullname]: bad array subscript
#shopt -q -s extdebug

shopt -q -s dotglob
shopt -q -s extglob
shopt -q -s globstar
# -------------------------------------------
# result of glob expansion matching no files:
# -------------------------------------------
# shopt -q -s failglob    # error
shopt -q -s nullglob    # null string


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

# **********
# *        *
# * NODEJS *
# *        *
# **********
source ~/.nvm/nvm.sh
nvm alias default stable > /dev/null

# *********
# *       *
# * GNOME *
# *       *
# *********
# gconftool --set -t string /desktop/gnome/interface/gtk_key_theme Vim
# gconftool --set -t string /desktop/gnome/interface/gtk_key_theme Emacs


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


# ****************
# *              *
# * LOAD .BASHRC *
# *              *
# ****************

if [ -f ~/.bashrc]; then . ~/.bashrc; fi


# # ********************
# # *                  *
# # * EXPORT FUNCTIONS *
# # *                  *
# # ********************

# for fn in `declare -F | tr -s ' ' | cut -d' ' -f3 | grep '^[^_]'`; do
# 	export -f $fn >/dev/null
# done

# ----------------------------------------------------------------------------

set +a

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
