#                                                                 -*- shell-script -*-
[[ ! -z $DEBUG  ]] && echo "sourcing .bash_profile"

# # nullglob option needed for .sh-env
# shopt -s nullglob

# .bash-profile -> .profile
[ -e ~/.profile ] && source ~/.profile

# -------------------------------------------------------------------------------
