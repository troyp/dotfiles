#                                                          -*- shell-script -*-
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
plugins=(git)

# User configuration

  # export PATH="/home/troy/.rvm/gems/ruby-2.1.2/bin:/home/troy/.rvm/gems/ruby-2.1.2@global/bin:/home/troy/.rvm/rubies/ruby-2.1.2/bin:/home/troy/.nvm/versions/node/v0.12.7/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/troy/.rvm/bin:/home/troy/.linuxbrew/bin:/home/troy/.fzf:/home/troy/.emacs.d:/home/troy/.scripts:/home/troy/.cabal/bin:/home/troy/.nimble/bin:/home/troy/gowork/bin:/home/troy/code/working:/home/troy/code/scripts:/home/troy/Android/Sdk/tools:/home/troy/Android/Sdk/platform-tools:/opt/scala/bin:/opt/j64-804/bin:/opt:/opt/bin:/opt/scripts:/opt/firefox:/opt/calibre:/opt/xcape:/opt/LightTable:/opt/sbt/bin:/opt/racket/bin:/opt/eclipse:/opt/nim/bin:/opt/clean/bin:/opt/rstudio/bin:/opt/processing:/opt/tor-browser:/opt/helpdeco:/opt/lfe-master/bin:/usr/local/texlive/2014/bin/x86_64-linux:/opt/pdf-diff:/opt/pdfdir:/opt/sejda-console/bin:/opt/jpdfbookmarks:/opt/info2html:/opt/SublimeText2:/opt/peazip:/opt/peazip/res:/opt/lilyterm/bin:/opt/phantomjs-2.0.0/bin:/opt/icon/bin:/home/troy/.fzf/bin"
# export MANPATH="/usr/local/man:$MANPATH"

if [ -f ~/.shrc ]; then            source ~/.shrc;            fi
if [ -f $ZSH/oh-my-zsh.sh ]; then  source $ZSH/oh-my-zsh.sh;  fi
if [ -f ~/.zsh-functions ]; then   source ~/.zsh-functions;   fi
if [ -f ~/.zsh-aliases ]; then     source ~/.zsh-aliases;     fi

zsh_URL=https://sourceforge.net/projects/zsh/files/latest/download?source=typ_redirect

bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

zstyle ':completion:*' list-prompt   ''
zstyle ':completion:*' select-prompt ''
autoload -Uz compinit
compinit

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

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
