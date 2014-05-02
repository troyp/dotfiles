# to override: use \ or '' (eg. \ls or 'ls')
# to "escape" ' (when you need both ' and " in alias): use '"'"'
#    (doesn't really escape - it ends string, concatenates string "'" (a single
#     quote) and concatenates a new string that extends to the end of the alias)

#-------------------------
# DEBIAN-SPECIFIC ALIASES
#-------------------------
alias sapt='sudo apt-get'
alias sapti='sudo apt-get install'
alias aptc='apt-cache'
alias aptcs='apt-cache search'
alias aptcp='apt-cache policy'
alias aptcsh='apt-cache show'

#---------------------
# CD & MKDIR ALIASES.
#---------------------
alias ..='cd ..'
alias ...='cd ...'
alias ....='cd ....'
alias .....='cd .....'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias md='mkdir -p'
alias md='mkdir -pv'
alias rn='source ranger ranger'    # navigate to new dir with ranger

#------------
# LS ALIASES.
#------------
alias ls='ls --color=auto'
alias ll='ls -l --group-directories-first --color=auto'
alias la='ls -Al --color=auto'
alias lr='ls -lR --color=auto'
alias lc='ls -CF --color=auto'
alias lsub='ls -d */'    # list subdirectories of current dir
alias lsubv='ls -p | command grep -o ^.*/$ | xargs ls -d --color=auto'  # visible only


#-----------------------
# FILE RENAMING ALIASES.
#-----------------------
alias emdir="env EDITOR='emacs -fh' vidir"    # rename files with emacs/vidir
alias emv="qmv -e 'emacsclient -nw'"          # rename files with emacs/qmv
alias ecp="qcp -e 'emacsclient -nw'"          # rename files with emacs/qcp


#------------------------
# WGET & RELATED ALIASES.
#------------------------
alias wgetm='wget -mkpE -np'   # -m='-r -N -l inf --no-remove-listing'
alias wgetmlimit='wget -rkpNE -np -l'  #eg wgetmlimit 2... (2 recurs lvls)
alias wgetmcut='wgetm -nH --cut-dirs'  #eg wgetmcut 2 ... (removes root + top 2 subdirs)
alias wgetmflat='wgetm -nd'
alias wgetmstealth='wgetm -e robots=off -U="Mozilla" -w 1'
alias wget1='wget -rNkpE -l 1 --no-remove-listing'
alias listhttplinks='xargs elinks --dump | grep "http" | sed "s/.*http/http/g"' # Waits for url from stdin then lists http links on page. Pipe to wget.

#------------------------
# BROWSER/SERVER ALIASES.
#------------------------
# alias manh='man -Hfirefox'   # problem with grohtml images
alias manh='man -Hchromium-browser'   # problem with grohtml images
alias archm='sudo archmage -p'    # eg. archm 81 myfile.chm
alias ff='firefox -no-remote -P'
alias ffmain='firefox no-remote -P default'
alias ffsearch='firefox -search'

#--------------------
# NETWORKING ALIASES.
#--------------------
alias tracert='traceroute'
alias ports='netstat -tunp'

#-------------------
# OPEN & SU ALIASES.
#-------------------
alias xrun='xdg-open'
alias grun='gnome-open'
alias krun='kde-open'
alias ksu='kdesudo'

#-------------------
# CLIPBOARD ALIASES.
#-------------------
alias cb='xsel -ob'      # for i in `seq 5`; do echo $(cb); done  # prints clipboard 5x
alias 2cb='xsel -ib'     # uptime | 2cb    # puts uptime in clipboard
# xsel or xclip copies stdin to selection
alias 2sel='xsel -ip'


#--------------
# BASH ALIASES.
#--------------
alias vi-bindings='set -o vi'
alias emacs-bindings='set -o emacs'


#-----------------------
# COLOUR PICKER ALIASES.
#-----------------------
alias eyed='gpick'
alias grabhexcol='grabc 2>/dev/null'
alias grabrgbcol='grabc 1>/dev/null'
alias pick='grabc 2>/dev/null | xsel -ib'
alias pickrgb='grabc 1>/dev/null | xsel -ib'

#-------------------
# CUT & PASTE FILES.
#-------------------
alias cf='xclip-copyfile'
alias xf='xclip-cutfile'
alias pf='xclip-pastefile'

#-----------------
# ARCHIVE ALIASES.
#-----------------
alias untargz='tar xzvf'
alias untarbz2='tar xjvf'
alias untar='tar xaf'    # unarchive - multiple formats  # use unar instead
alias lstar='tar taf'    # list contents - multiple formats
# tgz [name [files]]    make .tgz out of files
# unar unarchive multiple formats

#------------------
# SETTINGS ALIASES.
#------------------
alias editalias='${EDITOR:-vim} ~/.bash_aliases; source ~/.bash_aliases'
alias xres='xrdb ~/.Xresources'
alias setopts='set -o | grep "on$"'
alias lspath='echo $PATH|tr ":" "\n"'

#---------------------
# APPLICATION ALIASES.
#---------------------
alias factorlang='/opt/factor/factor'
alias coline='command col'    # leave col free as a column selection command

#---------------------------------
# APPLICATION DEFAULTS & VARIANTS.
#---------------------------------
alias vi='nvi'
alias enw='emacs -nw'
alias e='emacsclient -nw'
alias roxterm-display='roxterm --hide-menubar -T "Roxterm Display" -z 1.3 --geometry=70x40'
alias nautilus='nautilus --no-desktop'
alias ack='ack-grep'
alias mc='mc -S gotar'
alias diff='colordiff -u'
alias bc='bc -l'
alias echoe='echo -e'
alias esed='sed -r'
alias pdfg='pdfgrep -n'
alias sulocate='sudo locate'
alias sudb='sudo updatedb'
alias untgz='tar -zxvf'
alias vip='vimpager'
alias dfh='df -h'
alias rscopy='rsync -avzH --progress'
alias rsupdate='rsync -auvzH --progress'
#alias info='pinfo'
alias info='info --vi-bindings'
# enable color support of ls, etc, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#-----------------------------
# EDITORS & PROGRAMMING TOOLS.
#-----------------------------
alias viminstall='cd ~/.vim/bundle; git clone'
alias pynote='ipython notebook --pylab=inline'
alias ipylab='ipython --pylab'
alias mzscheme='rlwrap mzscheme'
alias colorize='pygmentize -f terminal256 -O style=native -O -l'  # eg. "cat file | colorizelang c"
#alias colorizelang='source-highlight -f esc -s'  # eg. "cat file | colorizelang c"
alias colorize='pygmentize -f terminal256 -O style=native -O -g'    # eg. "cat file | colorize"
alias etags_rec_el_c_h='find . -type f -iregex '.*[.]\(c\|h\|el\)' | etags -'
alias etags_sudo_rec_el_c_h='find . -type f -iregex '.*[.]\(c\|h\|el\)' | sudo etags -'
alias extract_elisp='find . -name "*.el.gz" | xargs sudo gunzip'
alias core-on='ulimit -c unlimited'
alias core-off='ulimit -c 0'
alias cljload='java -jar ~/.clojure/clojure.jar'
alias java-setdefault='sudo update-alternatives --config java'
alias pl='perl -e'
alias plp='perl -pe'
alias perlrepl='perl -de 0'
alias phprepl='php --interactive'
# http://fredkschott.com/post/2014/02/git-log-is-so-2005/
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"

#---------------
# OTHER ALIASES.
#---------------
alias iselect='iselect -kj:KEY_DOWN -kk:KEY_UP'
alias choose='iselect -ma'
alias choose-and-show='iselect -ma | xargs cat'
alias hdd='df -hT'
alias tolines='tr " \t" "\n\n"'
alias splitpath='tr ":" "\n"'
alias firstcol="cut -d' ' -f1"
alias append='cat >>'
alias say='spd-say -r -40 -t male2'
alias xevkb="xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keycode /s/^.*keycode \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p'"
# alias mans='man -k . | grep'  # use whatis -r (or -w) instead
alias concatpdfs='gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=out.pdf' # joins pdfs in order
alias partitionlist='fdisk -l'
# alias maplines='xargs -d "\n" -n 1'
alias maplines='xargs -L1'
alias dolines='while read -r x; do'
alias prdirs='while read -r line; do dirname "`readlink -f "$line"`"; done | uniq'
alias dofields='while read -r x1 x2 x3 x4 x5 x6 x7 x8 x9; do'
# while read -r x; do echo "stmts using $x"; done
alias imaplines='xargs -d "\n" -n 1 -p'
alias dofiles='for x in *; do'
alias mapfiles='for x in *; do echo "$x" |'
alias locatedirs='cat|xargs locate|prdirs'
alias myprocs='ps uxf'
alias myprocsbymem='ps -u $USER -O pid,user,s,tty,%mem,comm,start,cputime --sort -%mem'
alias die='killall -vs9'
alias distro='cat /etc/lsb-release'
alias ranalnum='tr -dc "[:lower:]0-9" < /dev/urandom | head -c'
alias ranAlnum='tr -dc "[:alpha:]0-9" < /dev/urandom | head -c'
alias ranalpha='tr -dc "[:lower:]" < /dev/urandom | head -c'
alias ranAlpha='tr -dc "[:alpha:]" < /dev/urandom | head -c'
alias rannum='tr -dc "0-9" < /dev/urandom | head -c'
alias deduppath="awk -F: '{for (i=1;i<=NF;i++) { if ( !x[\$i]++ ) printf(\"%s:\",\$i); }}'"
alias pman='pinfo -m'
