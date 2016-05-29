#                                                           -*- shell-script -*-
[ -z "$PS1" ] && return

set -a

# common startup files
source ~/.shrc

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

# --------
# HISTORY.
# --------
HISTCONTROL=ignorespace:ignoredups:erasedups
HISTFILESIZE=100000
HISTSIZE=100000
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
# history-refresh function (in ~/.sh-functions): refreshes history (brings
# in commands that have been typed in other shells since the shell started)
shopt -q -s cmdhist
shopt -q -s histappend
shopt -q -s histreedit
shopt -q -s histverify
shopt -q -s lithist

# ********
# *      *
# * MISC *
# *      *
# ********

# ---enable color support of ls---
# if [ -x /usr/bin/dircolors ]; then test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)" fi

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

if [ -f ~/.bash-aliases ]; then . ~/.bash-aliases; fi
if [ -f ~/.sh-aliases ]; then . ~/.sh-aliases; fi
if [ -f ~/.bash-prompt ]; then . ~/.bash-prompt; fi
if [ -f ~/.sh-functions ]; then . ~/.sh-functions; fi
if [ -f ~/.sh-functions-track-installs.sh ]; then . ~/.sh-functions-track-installs.sh; fi
if [ -f /etc/profile.d/bash_completion.sh ]; then . /etc/profile.d/bash_completion.sh; fi
if [ -n "$LOAD_SCRATCH" ] && [ -f ~/.bash-scratch ]; then . ~/.bash-scratch; fi

# ---bashmarks---
# source .bashmarks-setup.sh after .sh-functions
if [ -f ~/.bashmarks-setup.sh ]; then . ~/.bashmarks-setup.sh; fi

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

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
