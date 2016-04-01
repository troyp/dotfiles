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
