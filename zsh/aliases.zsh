# achive the same function on different platforms of the different procedures
if [[ "Darwin" = "$(uname)" ]] ; then
  MVJ3_CLIPBOARD="pbcopy"
elif [[ "Linux" = "$(uname)" ]] ; then
  MVJ3_CLIPBOARD="xclip"
fi
# file utility
alias mv="mv -i"
alias rm="rm -i"
alias cp="cp -i"
alias la="ls -a"
alias ls="ls -pG --color"
alias ll="ls -lh"
alias gwd="pwd | $MVJ3_CLIPBOARD"
alias rm-DS_Store="find . -name '.DS_Store' -exec rm '{}' \;"
alias rm-Dot_svn="find . -name '.svn' -exec rm -rf '{}' \;"

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

# svn
alias svn-ignore="SVN_EDITOR='vim' svn propedit svn:ignore ."

# rails
alias t='autotest'
alias rr='rake routes | grep'
alias dcm='rake db:drop && rake db:create && rake db:migrate'
alias dcm_production="RAILS_ENV='production' rake db:drop && RAILS_ENV='production' rake db:create && RAILS_ENV='production' rake db:migrate"
alias ss="ruby script/server"
alias sc='ruby script/console'
alias taild='tail -fn100 log/development.log'
alias tailt='tail -fn100 log/test.log'
alias tailp='tail -fn100 log/production.log'
alias taildg="tail -fn100 log/development.log | grep '###'"
alias tailtg="tail -fn100 log/test.log | grep '###'"
alias sg="./script/generate"
alias sp="./script/plugin"

# passenger
alias tlog="tail -f log/development.log"
alias rst="touch tmp/restart.txt"

# rspec
alias specc="spec -f s spec/controllers"
alias specm="spec -f m spec/models"
alias specmc="spec -f s spec/controllers; spec -f s spec/models"

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# program launch
if [[ "Darwin" = "$(uname)" ]] ; then
  alias firefox="open -a firefox"
  alias safari="open -a safari"
  alias xulrunner="/Library/Frameworks/XUL.framework/xulrunner-bin "
  alias hibernateon='sudo pmset -a hibernatemode 1'
  alias hibernateoff='sudo pmset -a hibernatemode 0'
  alias quicktime='open -a QuickTime\ Player'
  alias scripteditor='open -a Script\ Editor'
  alias l='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'
  alias dock="killall Dock"
  alias o="open"
  #alias update_macports="sudo port selfupdate && sudo port sync && sudo port outdated"
elif [[ "Linux" = "$(uname)" ]] ; then
  alias mvj3.fcitx_and_xscreensaver="fcitx && xscreensaver -no-splash &"
  alias l='xscreensaver-command -lock'
fi
alias p="ping"
alias i="curl -I"
#alias js='java org.mozilla.javascript.tools.shell.Main'
alias g.cn="ping -c 1 g.cn >> /dev/null 2>&1 && echo 'You Are Connecting To The Internet Right now!'"
alias dict='dict -d wn'
alias info='info --vi-keys'
alias cmi="./configure && make && sudo make install"
alias man="gem man -s"

# http server
#alias gembox="sudo gembox -p 8808 >> /dev/null 2>&1 &"
alias SimpleHTTPServer="/usr/bin/python -m SimpleHTTPServer >> /dev/null 2>&1 &" # port 8000
#alias instiki_Documents="instiki -t='/Users/chenyuzai/Documents/instiki/storage'"
#alias gemserver="gem server >> /dev/null 2>&1 &"

# mysql
if [[ "Darwin" = "$(uname)" ]] ; then
  alias start_mysql="/Library/StartupItems/MySQLCOM/MySQLCOM start"
  alias stop_mysql="/Library/StartupItems/MySQLCOM/MySQLCOM stop"
  alias restart_mysql="Library/StartupItems/MySQLCOM/MySQLCOM restart"
fi
