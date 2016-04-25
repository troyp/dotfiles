#                                                                 -*- shell-script -*-

# .zprofile -> .profile -> .sh-profile
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'
