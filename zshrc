# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory autocd  extendedglob nomatch notify
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/chenyuzai/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# file utility
alias mv="mv -i"
alias rm="rm -i"
alias cp="cp -i"
alias v="vim"
alias ri=qri
alias mysql=mysql5
alias la="ls -a"
alias ls="ls -pG"
alias ll="ls -lh"
alias l='ls -l'

# git
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gD='git diff --cached'
alias ga='git add'
alias gc='git commit -v'
alias gb='git branch'
alias gs='git status'
alias gr='git rebase'
alias gri='git rebase -i origin/master'
alias gm='git merge'
alias gg='git log --pretty=oneline --abbrev-commit'
alias gco='git checkout'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gps='git svn dcommit'
alias gls='git svn rebase'

# rails
alias t='autotest'
alias rr='rake routes | grep'
alias rs='touch tmp/restart.txt'
alias ss='ruby script/server'
alias sc='ruby script/console'
alias taild='tail -fn100 log/development.log'
alias tailt='tail -fn100 log/test.log'
alias tailp='tail -fn100 log/production.log'
alias taildg="tail -fn100 log/development.log | grep '###'"
alias tailtg="tail -fn100 log/test.log | grep '###'"

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# program launch
alias firefox="open -a firefox"
alias safari="open -a safari"
alias m="mvim"
alias xulrunner="/Library/Frameworks/XUL.framework/xulrunner-bin "
alias hibernateon='sudo pmset -a hibernatemode 1'
alias hibernateoff='sudo pmset -a hibernatemode 0'
alias quicktime='open -a QuickTime\ Player'
alias scripteditor='open -a Script\ Editor'
alias tellappsystemeventstosleep='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'
alias js='java org.mozilla.javascript.tools.shell.Main'
alias geminstall="sudo gem install --rdoc --no-ri"
alias gemupdate="sudo gem update --rdoc --no-ri"
alias g.cn="ping -c 1 g.cn >> /dev/null 2>&1 && echo 'You Are Connecting To The Internet Right now!'"
alias dict='dict -d wn'
alias info='info --vi-keys'
alias q="exit"
alias dock="killall Dock"

# http server
alias gembox="sudo gembox -p 8808 >> /dev/null 2>&1 &"
alias SimpleHTTPServer="/usr/bin/python -m SimpleHTTPServer >> /dev/null 2>&1 &"
alias instiki_Documents="instiki -t='/Users/chenyuzai/Documents/instiki/storage'"
#
#  automatically enter directories without cd
setopt auto_cd

# # use vim as an editor
export EDITOR=vim

# aliases
if [ -e "$HOME/.aliases" ]; then
   source "$HOME/.aliases"
fi

# vi mode
bindkey -v

# use incremental search
#bindkey ^R history-incremental-search-backward

# expand functions in the prompt
setopt prompt_subst

# prompt
#export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo "[%{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}]"
  fi
}

export PS1='$(git_prompt_info)[${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%~%{$reset_color%}] '
export PATH=/Users/chenyuzai/bin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:$PATH

# PAGER = 'less -X -M'
# export LESSOPEN = "| /usr/bin/src-hilite-lesspipe.sh %s"
# export LESS = ' -R '


export CLASSPATH="/opt/local/addedbymvj3:/opt/local/addedbymvj3/js.jar"

fpath=($fpath $HOME/.zsh/func)
typeset -U fpath

title()   { print -Pn "\e]0;$*\a" }
precmd()  { title "$0" }
preexec() { title $1 }

# Package Ruby Software
RIPDIR="$HOME/.rip"
RUBYLIB="$RUBYLIB:$RIPDIR/active/lib"
PATH="$PATH:$RIPDIR/active/bin"
export RIPDIR RUBYLIB PATH

# vim:set ft=zsh:
