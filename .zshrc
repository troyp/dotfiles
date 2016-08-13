#                                                          -*- shell-script -*-
[[ ! -z $DEBUG  ]] && echo "sourcing .zshrc"

export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel9k-modified/powerlevel9k"
ZSH_THEME="troyp/troyp"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(history time dir rbenv vcs root_indicator)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(history status os_icon)
POWERLEVEL9K_MODE='awesome-fontconfig'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git dirhistory)

# User configuration

#     ,------------------,
#     | LOAD OTHER FILES |
#     '------------------'
# startup files
if [[ -f ~/.shrc ]];           then source ~/.shrc;            fi
if [[ -f $ZSH/oh-my-zsh.sh ]]; then
    source $ZSH/oh-my-zsh.sh;
    # reload prompt (since oh-my-zsh.sh doesn't do it properly)
    if [[ -e "$ZSH_CUSTOM/$ZSH_THEME.zsh-theme" ]]; then
        source "$ZSH_CUSTOM/$ZSH_THEME.zsh-theme"
    elif [[ -e "$ZSH_CUSTOM/themes/$ZSH_THEME.zsh-theme" ]]; then
        source "$ZSH_CUSTOM/themes/$ZSH_THEME.zsh-theme"
    fi
fi
# aliases
if [[ -f ~/.zsh-aliases ]];    then source ~/.zsh-aliases;     fi
# functions
if [[ -f ~/.zsh-functions ]];  then source ~/.zsh-functions;   fi

zsh_URL=https://sourceforge.net/projects/zsh/files/latest/download?source=typ_redirect

bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward
bindkey "^[[A" up-line-or-search
bindkey "^[[B" down-line-or-search
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward
# override oh-my-zsh
bindkey '\el' down-case-word
bindkey -s '^x^z' ~/.oh-my-zsh/custom/

# foreground widget: C-z
fgwidget() { fg }
zle -N fgwidget
bindkey '^Z' fgwidget

zstyle ':completion:*' list-prompt   ''
zstyle ':completion:*' select-prompt ''
autoload -Uz compinit
compinit

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
