#                                                           -*- shell-script -*-
[ -z "$PS1" ] && return

set -a


# ********
# *      *
# * MISC *
# *      *
# ********

# ---enable color support of ls---
# if [ -x /usr/bin/dircolors ]; then test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)" fi

xmodmap -e "keycode 127 = Pause"

# ---run xcape---
if ! pgrep xcape >/dev/null; then
    xcape -e 'Control_L=Escape;Super_R=Menu;Control_R=Multi_key' &
fi


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
if [ -f ~/.bash-prompt ]; then . ~/.bash-prompt; fi
if [ -f ~/.bash-functions ]; then . ~/.bash-functions; fi
if [ -f ~/.rvm/scripts/rvm ]; then . ~/.rvm/scripts/rvm; fi
if [ -f ~/.bash-functions-track-installs.sh ]; then . ~/.bash-functions-track-installs.sh; fi
if [ -f /etc/profile.d/bash_completion.sh ]; then . /etc/profile.d/bash_completion.sh; fi
if [ -n "$LOAD_SCRATCH" ] && [ -f ~/.bash-scratch ]; then . ~/.bash-scratch; fi

# ---bashmarks---
# source .bashmarks-setup.sh after .bash-functions
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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
