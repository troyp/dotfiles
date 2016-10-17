#                                                           -*- shell-script -*-
[[ ! -z $DEBUG  ]] && echo "sourcing .bashrc"

[[ -z "$PS1" ]] && return

set -a

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

# environment: sourcing from .sh-profile doesn't seem to be sufficient, so load in .bashrc
[[ -f ~/.sh-env ]]          && source ~/.sh-env
# common startup files
 [[ -f ~/.shrc ]]           && source ~/.shrc fi      # .shrc sources .sh-aliases, .sh-functions
# aliases
 [[ -f ~/.bash-aliases ]]   && source ~/.bash-aliases
# functions
 [[ -f ~/.bash-functions ]] && source ~/.bash-functions
# prompt
 [[ -f ~/.bash-prompt ]]    && source ~/.bash-prompt
# completion
 [[ -f /etc/profile.d/bash_completion.sh ]] && source /etc/profile.d/bash_completion.sh
# misc
 [[ -n "$LOAD_SCRATCH" ]]  && [[ -f ~/.bash-scratch ]] && source ~/.bash-scratch

# ---bashmarks---
# source .bashmarks-setup.sh after .sh-functions
 [[ -f ~/.bashmarks-setup.sh ]] && source ~/.bashmarks-setup.sh


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

# [[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
