#                                                                 -*- shell-script -*-

# .bash_profile -> .profile -> .sh-profile
[ -e ~/.profile ] && source ~/.profile

# fzf (https://github.com/junegunn/fzf)
[ -e ~/.fzf.bash ] && source ~/.fzf.bash
