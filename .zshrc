#                                                          -*- shell-script -*-
[[ ! -z $DEBUG  ]] && echo "sourcing .zshrc"

#     ,------------------,
#     | LOAD OTHER FILES |
#     '------------------'

[[ -f ~/.shrc ]] && source ~/.shrc;      # .shrc sources .sh-aliases, .sh-functions
# ZSH-specific aliases and functions
[[ -f ~/.zsh-aliases ]]   && source ~/.zsh-aliases;
[[ -f ~/.zsh-functions ]] && source ~/.zsh-functions;
[[ -f ~/.zsh-prompt ]] && source ~/.zsh-prompt

# ZSH-specific functions directory
fpath+=~/.zfunc

zsh_URL=https://sourceforge.net/projects/zsh/files/latest/download?source=typ_redirect

# ,---------,
# | history |
# '---------'
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt inc_append_history_time

# ,---------,
# | options |
# '---------'
setopt null_glob
# setopt extended_glob
setopt autocd

# ,------------,
# | completion |
# '------------'
zstyle ':completion:*' list-prompt   ''
zstyle ':completion:*' select-prompt ''

autoload -U +X compinit && compinit
# case-insensitive
# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ,--------------,
# | key bindings |
# '--------------'
# To find key codes, use <C-v><KEY>, or cat

bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward
bindkey "^U" backward-kill-line
bindkey "^[[A" up-line-or-search
bindkey "^[[B" down-line-or-search
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward
bindkey "^[a" _expand_alias  # Alt-A
bindkey "^L" delete-char

bindkey -s '^X^D^B' "cd ~/ebooks/\n"
bindkey -s '^X^D^[' "cd ~/code/\n"
bindkey -s '^X^D^D' "cd ~/dotfiles/\n"
bindkey -s '^X^D^E^E' "cd ~/.emacs.d/private/\n"
bindkey -s '^X^D^E^L' "cd /usr/local/share/emacs/26.1/lisp/emacs-lisp\n"
bindkey -s '^X^D^G' "cd ~/.config\n"
bindkey -s '^X^D^H' "cd ~/\n"
bindkey -s '^X^D^I' "cd ~/Pictures\n"
bindkey -s '^X^D^K' "cd ~/bookmarks/\n"
bindkey -s '^X^D^L' "cd ~/.local/\n"
bindkey -s '^X^D^O^O' "cd /opt/\n"
bindkey -s '^X^D^O^B' "cd /opt/bin/\n"
bindkey -s '^X^D^O^D' "cd /opt/doc/\n"
bindkey -s '^X^D^O^F' "cd /opt/ff-addons/\n"
bindkey -s '^X^D^O^I' "cd /opt/info/\n"
bindkey -s '^X^D^O^M' "cd /opt/man/\n"
bindkey -s '^X^D^O^S' "cd /opt/scripts/\n"
bindkey -s '^X^D^O^U' "cd /opt/userscripts/\n"
bindkey -s '^X^D^O^Y' "cd /opt/userstyles/\n"
bindkey -s '^X^D^P' "cd ~/.pentadactyl/\n"
bindkey -s '^X^D^R' "cd ~/repos/\n"
bindkey -s '^X^D^S' "cd ~/.scripts/\n"
bindkey -s '^X^D^T' "cd ~/tools/\n"
bindkey -s '^X^D^U^U' "cd /usr/\n"
bindkey -s '^X^D^U^B' "cd /usr/bin/\n"
bindkey -s '^X^D^U^L^L' "cd /usr/local/\n"
bindkey -s '^X^D^U^L^B' "cd /usr/local/bin/\n"
bindkey -s '^X^D^U^S' "cd /usr/share/\n"
bindkey -s '^X^D^Y' "cd ~/.tridactyl/\n"
bindkey -s '^X^D^Z' "cd ~/.oh-my-zsh/custom/\n"

bindkey -s '^X^I^B' "~/ebooks/"
bindkey -s '^X^I^[' "~/code/"
bindkey -s '^X^I^D' "~/dotfiles/"
bindkey -s '^X^I^E^E' "~/.emacs.d/private/"
bindkey -s '^X^I^E^L' "/usr/local/share/emacs/26.1/lisp/emacs-lisp"
bindkey -s '^X^I^G' "~/.config"
bindkey -s '^X^I^H' "~/"
bindkey -s '^X^I^I' "~/Pictures"
bindkey -s '^X^I^K' "~/bookmarks/"
bindkey -s '^X^I^L' "~/.local/"
bindkey -s '^X^I^O^O' "/opt/"
bindkey -s '^X^I^O^B' "/opt/bin/"
bindkey -s '^X^I^O^D' "/opt/doc/"
bindkey -s '^X^I^O^F' "/opt/ff-addons/"
bindkey -s '^X^I^O^I' "/opt/info/"
bindkey -s '^X^I^O^M' "/opt/man/"
bindkey -s '^X^I^O^S' "/opt/scripts/"
bindkey -s '^X^I^O^U' "/opt/userscripts/"
bindkey -s '^X^I^O^Y' "/opt/userstyles/"
bindkey -s '^X^I^P' "~/.pentadactyl/"
bindkey -s '^X^I^R' "~/repos/"
bindkey -s '^X^I^S' "~/.scripts/"
bindkey -s '^X^T^T' "~/tools/"
bindkey -s '^X^I^U^U' "/usr/"
bindkey -s '^X^I^U^B' "/usr/bin/"
bindkey -s '^X^I^U^L^L' "/usr/local/"
bindkey -s '^X^I^U^L^B' "/usr/local/bin/"
bindkey -s '^X^I^U^S' "/usr/share/"
bindkey -s '^X^I^Y' "~/.tridactyl/"
bindkey -s '^X^I^Z' "~/.oh-my-zsh/custom/"

bindkey -s "^X^H^K" "viewcompose\n"

bindkey -a '^X^Q' push-line-or-edit
bindkey -v '^X^U' kill-whole-line

# -------------------------------------------------------------------------------
# ,--------------,
# | vi-mode init |
# '--------------'
bindkey -v
# Mode switch delay
KEYTIMEOUT=5

# ## FIXME: causes a `q` to be inserted when pressing escape (but ignored by shell)
# # cursor shape
# function zle-keymap-select {
#     if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
#         echo -ne '\e[1 q';
#     elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
#         echo -ne '\e[5 q';
#     fi
# }
# zle -N zle-keymap-select
# function beam-cursor {
#     echo -ne '\e[5 q';
# }
# precmd_functions+=(beam-cursor);

# ,------------------,
# | vi-mode bindings |
# '------------------'
bindkey -a "U" redo
bindkey -v "^P" history-beginning-search-backward
bindkey -a "^P" history-beginning-search-backward
bindkey -v "^N" history-beginning-search-forward
bindkey -a "^N" history-beginning-search-forward
bindkey -v "^[[A" up-line-or-search
bindkey -a "^[[A" up-line-or-search
bindkey -v "^[[B" down-line-or-search
bindkey -a "^[[B" down-line-or-search
bindkey -v "^R" history-incremental-pattern-search-backward
bindkey -a "^R" history-incremental-pattern-search-backward
bindkey -v "^S" history-incremental-pattern-search-forward
bindkey -a "^S" history-incremental-pattern-search-forward
bindkey -v "^[a" _expand_alias  # Alt-A
bindkey -v "^XR" history-incremental-search-backward
bindkey -a "^XR" history-incremental-search-backward
bindkey -v "^XS" history-incremental-search-forward
bindkey -a "^XS" history-incremental-search-forward
bindkey -v "^[a" _expand_alias  # Alt-A
bindkey -a "^[a" _expand_alias  # Alt-A
bindkey -v "^L" vi-delete-char

bindkey -v -s '^X^D^B' "cd ~/ebooks/\n"
bindkey -a -s '^X^D^B' "cd ~/ebooks/\n"
bindkey -v -s '^X^D^[' "cd ~/code/\n"
bindkey -a -s '^X^D^[' "cd ~/code/\n"
bindkey -v -s '^X^D^D' "cd ~/dotfiles/\n"
bindkey -a -s '^X^D^D' "cd ~/dotfiles/\n"
bindkey -v -s '^X^D^E^E' "cd ~/.emacs.d/private/\n"
bindkey -a -s '^X^D^E^E' "cd ~/.emacs.d/private/\n"
bindkey -v -s '^X^D^E^L' "cd /usr/local/share/emacs/26.1/lisp/emacs-lisp\n"
bindkey -a -s '^X^D^E^L' "cd /usr/local/share/emacs/26.1/lisp/emacs-lisp\n"
bindkey -v -s '^X^D^G' "cd ~/.config\n"
bindkey -a -s '^X^D^G' "cd ~/.config\n"
bindkey -v -s '^X^D^H' "cd ~/\n"
bindkey -a -s '^X^D^H' "cd ~/\n"
bindkey -v -s '^X^D^I' "cd ~/Pictures\n"
bindkey -a -s '^X^D^I' "cd ~/Pictures\n"
bindkey -v -s '^X^D^K' "cd ~/bookmarks/\n"
bindkey -a -s '^X^D^K' "cd ~/bookmarks/\n"
bindkey -v -s '^X^D^L' "cd ~/.local/\n"
bindkey -a -s '^X^D^L' "cd ~/.local/\n"
bindkey -v -s '^X^D^O^O' "cd /opt/\n"
bindkey -a -s '^X^D^O^O' "cd /opt/\n"
bindkey -v -s '^X^D^O^B' "cd /opt/bin/\n"
bindkey -a -s '^X^D^O^B' "cd /opt/bin/\n"
bindkey -v -s '^X^D^O^D' "cd /opt/doc/\n"
bindkey -a -s '^X^D^O^D' "cd /opt/doc/\n"
bindkey -v -s '^X^D^O^F' "cd /opt/ff-addons/\n"
bindkey -a -s '^X^D^O^F' "cd /opt/ff-addons/\n"
bindkey -v -s '^X^D^O^I' "cd /opt/info/\n"
bindkey -a -s '^X^D^O^I' "cd /opt/info/\n"
bindkey -v -s '^X^D^O^M' "cd /opt/man/\n"
bindkey -a -s '^X^D^O^M' "cd /opt/man/\n"
bindkey -v -s '^X^D^O^S' "cd /opt/scripts/\n"
bindkey -a -s '^X^D^O^S' "cd /opt/scripts/\n"
bindkey -v -s '^X^D^O^U' "cd /opt/userscripts/\n"
bindkey -a -s '^X^D^O^U' "cd /opt/userscripts/\n"
bindkey -v -s '^X^D^O^Y' "cd /opt/userstyles/\n"
bindkey -a -s '^X^D^O^Y' "cd /opt/userstyles/\n"
bindkey -v -s '^X^D^P' "cd ~/.pentadactyl/\n"
bindkey -a -s '^X^D^P' "cd ~/.pentadactyl/\n"
bindkey -v -s '^X^D^R' "cd ~/repos/\n"
bindkey -a -s '^X^D^R' "cd ~/repos/\n"
bindkey -v -s '^X^D^S' "cd ~/.scripts/\n"
bindkey -a -s '^X^D^S' "cd ~/.scripts/\n"
bindkey -v -s '^X^D^T' "cd ~/tools/\n"
bindkey -a -s '^X^D^T' "cd ~/tools/\n"
bindkey -v -s '^X^D^U^U' "cd /usr/\n"
bindkey -a -s '^X^D^U^U' "cd /usr/\n"
bindkey -v -s '^X^D^U^B' "cd /usr/bin/\n"
bindkey -a -s '^X^D^U^B' "cd /usr/bin/\n"
bindkey -v -s '^X^D^U^L^L' "cd /usr/local/\n"
bindkey -a -s '^X^D^U^L^L' "cd /usr/local/\n"
bindkey -v -s '^X^D^U^L^B' "cd /usr/local/bin/\n"
bindkey -a -s '^X^D^U^L^B' "cd /usr/local/bin/\n"
bindkey -v -s '^X^D^U^S' "cd /usr/share/\n"
bindkey -a -s '^X^D^U^S' "cd /usr/share/\n"
bindkey -v -s '^X^D^Y' "cd ~/.tridactyl/\n"
bindkey -a -s '^X^D^Y' "cd ~/.tridactyl/\n"
bindkey -v -s '^X^D^Z' "cd ~/.oh-my-zsh/custom/\n"
bindkey -a -s '^X^D^Z' "cd ~/.oh-my-zsh/custom/\n"

bindkey -v -s '^X^I^B' "~/ebooks/"
bindkey -a -s '^X^I^B' "~/ebooks/"
bindkey -v -s '^X^I^[' "~/code/"
bindkey -a -s '^X^I^[' "~/code/"
bindkey -v -s '^X^I^D' "~/dotfiles/"
bindkey -a -s '^X^I^D' "~/dotfiles/"
bindkey -v -s '^X^I^E^E' "~/.emacs.d/private/"
bindkey -a -s '^X^I^E^E' "~/.emacs.d/private/"
bindkey -v -s '^X^I^E^L' "/usr/local/share/emacs/26.1/lisp/emacs-lisp"
bindkey -a -s '^X^I^E^L' "/usr/local/share/emacs/26.1/lisp/emacs-lisp"
bindkey -v -s '^X^I^G' "~/.config"
bindkey -a -s '^X^I^G' "~/.config"
bindkey -v -s '^X^I^H' "~/"
bindkey -a -s '^X^I^H' "~/"
bindkey -v -s '^X^I^I' "~/Pictures"
bindkey -a -s '^X^I^I' "~/Pictures"
bindkey -v -s '^X^I^K' "~/bookmarks/"
bindkey -a -s '^X^I^K' "~/bookmarks/"
bindkey -v -s '^X^I^L' "~/.local/"
bindkey -a -s '^X^I^L' "~/.local/"
bindkey -v -s '^X^I^O^O' "/opt/"
bindkey -a -s '^X^I^O^O' "/opt/"
bindkey -v -s '^X^I^O^B' "/opt/bin/"
bindkey -a -s '^X^I^O^B' "/opt/bin/"
bindkey -v -s '^X^I^O^D' "/opt/doc/"
bindkey -a -s '^X^I^O^D' "/opt/doc/"
bindkey -v -s '^X^I^O^F' "/opt/ff-addons/"
bindkey -a -s '^X^I^O^F' "/opt/ff-addons/"
bindkey -v -s '^X^I^O^I' "/opt/info/"
bindkey -a -s '^X^I^O^I' "/opt/info/"
bindkey -v -s '^X^I^O^M' "/opt/man/"
bindkey -a -s '^X^I^O^M' "/opt/man/"
bindkey -v -s '^X^I^O^S' "/opt/scripts/"
bindkey -a -s '^X^I^O^S' "/opt/scripts/"
bindkey -v -s '^X^I^O^U' "/opt/userscripts/"
bindkey -a -s '^X^I^O^U' "/opt/userscripts/"
bindkey -v -s '^X^I^O^Y' "/opt/userstyles/"
bindkey -a -s '^X^I^O^Y' "/opt/userstyles/"
bindkey -v -s '^X^I^P' "~/.pentadactyl/"
bindkey -a -s '^X^I^P' "~/.pentadactyl/"
bindkey -v -s '^X^I^R' "~/repos/"
bindkey -a -s '^X^I^R' "~/repos/"
bindkey -v -s '^X^I^S' "~/.scripts/"
bindkey -a -s '^X^I^S' "~/.scripts/"
bindkey -v -s '^X^I^T' "~/tools/"
bindkey -a -s '^X^I^T' "~/tools/"
bindkey -v -s '^X^I^U^U' "/usr/"
bindkey -a -s '^X^I^U^U' "/usr/"
bindkey -v -s '^X^I^U^B' "/usr/bin/"
bindkey -a -s '^X^I^U^B' "/usr/bin/"
bindkey -v -s '^X^I^U^L^L' "/usr/local/"
bindkey -a -s '^X^I^U^L^L' "/usr/local/"
bindkey -v -s '^X^I^U^L^B' "/usr/local/bin/"
bindkey -a -s '^X^I^U^L^B' "/usr/local/bin/"
bindkey -v -s '^X^I^U^S' "/usr/share/"
bindkey -a -s '^X^I^U^S' "/usr/share/"
bindkey -v -s '^X^I^Y' "~/.tridactyl/"
bindkey -a -s '^X^I^Y' "~/.tridactyl/"
bindkey -v -s '^X^I^Z' "~/.oh-my-zsh/custom/"
bindkey -a -s '^X^I^Z' "~/.oh-my-zsh/custom/"

bindkey -v -s "^X^H^K" "viewcompose\n"
bindkey -a -s "^X^H^K" "viewcompose\n"

bindkey -v '^X^Q' push-line-or-edit
bindkey -a '^X^Q' push-line-or-edit
bindkey -v '^X^U' kill-whole-line
bindkey -a '^X^U' kill-whole-line

# emacs keys for vi-mode
bindkey -v "^A" vi-beginning-of-line
bindkey -a "^A" vi-beginning-of-line
bindkey -v "^E" vi-end-of-line
bindkey -a "^E" vi-end-of-line
bindkey -v "^K" kill-line
bindkey -a "^K" kill-line
bindkey -v "^U" backward-kill-line
bindkey -a "^U" backward-kill-line
bindkey -v "^Y" yank
bindkey -a "^Y" yank
# emacs keys for vi-insert-mode
bindkey -v "^B" vi-backward-char
bindkey -v "^F" vi-forward-char
bindkey -v "^[." insert-last-word
bindkey -v "^D" vi-delete-char

# override oh-my-zsh
bindkey '\el' down-case-word    # restore downcase
bindkey ' ' self-insert         # disable magic-space (history expansion on space)

# foreground widget: C-z
fgwidget() { fg }
zle -N fgwidget
bindkey '^Z' fgwidget
bindkey -v '^Z' fgwidget
bindkey -a '^Z' fgwidget

# launch terminal on S-F4 (match Dolphin behaviour)
launchterminal() { x-terminal-emulator & }
zle -N launchterminal
# (roxterm etc)
bindkey '^[[1;2S' launchterminal
bindkey -v '^[[;1S' launchterminal
bindkey -a '^[[;1S' launchterminal
# (konsole)
bindkey '^[O2S' launchterminal
bindkey -v '^[O2S' launchterminal
bindkey -a '^[O2S' launchterminal

guirename() { pyrenamer -r $PWD 2>/dev/null & }
zle -N guirename
bindkey '^[OQ' guirename
bindkey -v '^[OQ' guirename
bindkey -a '^[OQ' guirename

# copy last command on A-Ins
copylastcommand() { fc -ln -1 -1 | xsel -ib; }
zle -N copylastcommand
bindkey '^[[2;3~' copylastcommand
bindkey -v '^[[2;3~' copylastcommand
bindkey -a '^[[2;3~' copylastcommand

# copy last result on C-~ or C-Ins (note: reevaluates)
copylastresult() { eval `fc -ln -1 -1` | xsel -ib }
zle -N copylastresult
bindkey '^[[2;5~' copylastresult
bindkey -v '^[[2;5~' copylastresult
bindkey -a '^[[2;5~' copylastresult
bindkey '^@' copylastresult
bindkey -v '^@' copylastresult
bindkey -a '^@' copylastresult

# calculator f8
opencalc() { (roxterm -e wcalc &) 2>/dev/null; }
zle -N opencalc
bindkey "^[[19~" opencalc
bindkey -v "^[[19~" opencalc
bindkey -a "^[[19~" opencalc

# open file browser: f12=dolphin, S-f12=ranger
open_file_browser_graphical() { ( dolphin . & ) 2>/dev/null; }
open_file_browser_text() { ( roxterm -m -e ranger . & ) 2>/dev/null; }
zle -N open_file_browser_graphical
zle -N open_file_browser_text
bindkey "^[[24~" open_file_browser_graphical
bindkey -v "^[[24~" open_file_browser_graphical
bindkey -a "^[[24;2~" open_file_browser_text
bindkey "^[[24~" open_file_browser_graphical
bindkey -v "^[[24;2~" open_file_browser_text
bindkey -a "^[[24;2~" open_file_browser_text

# Set up Haskell Stack autocompletion (after compinit line)
autoload -U +X bashcompinit && bashcompinit
eval "$(stack --bash-completion-script stack)"

# Force file-name completion
complete-files () {
    compadd - "$PREFIX"*
}
zle -C force-complete-files complete-word complete-files
# TODO: make repeated file-completion key presses cycle
# TODO: no space after completing a directory
bindkey '^@' force-complete-files     # Ctrl-SPC

autoload -Uz promptinit
promptinit

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# # OPAM configuration
# . /home/troy/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# ,------,
# | Ruby |
# '------'
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# RBENV configuration
alias rbenvinit='eval "$(rbenv init -)"'

# # ,-----,
# # | FZF |
# # '-----'
# # default bindings:
# #     C-t (paste files & directories)
# #     C-r (paste from history)
# #     A-c (cd into directory)
# export FZF_DEFAULT_COMMAND='ag --all-types --hidden --ignore .git -f -g "" | cat'
# export FZF_DEFAULT_COMMAND='rg -p -L --files --no-ignore --hidden --glob "!.git/*"'
# export FZF_DEFAULT_OPTS='--ansi --exact --border --bind=ctrl-i:toggle+down --preview "cat {} | pygmentize -f terminal256 -O style=native -g"'

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh    # causes completion to crash (shell exits on TAB)
