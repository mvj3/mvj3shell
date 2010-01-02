# file utility
alias mv="mv -i"
alias rm="rm -i"
alias cp="cp -i"
alias la="ls -a"
alias ls="ls -pG"
alias ll="ls -lh"
alias gwd="pwd | pbcopy"
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
alias firefox="open -a firefox"
alias safari="open -a safari"
alias m="mvim"
alias p="ping"
alias q="exit"
alias o="open"
alias i="curl -I"
alias xulrunner="/Library/Frameworks/XUL.framework/xulrunner-bin "
alias hibernateon='sudo pmset -a hibernatemode 1'
alias hibernateoff='sudo pmset -a hibernatemode 0'
alias quicktime='open -a QuickTime\ Player'
alias scripteditor='open -a Script\ Editor'
alias l='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'
alias js='java org.mozilla.javascript.tools.shell.Main'
alias geminstall="sudo gem install --rdoc --no-ri"
alias lgeminstall="rake gem && geminstall pkg/*.gem"
alias gemuninstall="sudo gem uninstall"
alias gemupdate="sudo gem update --rdoc --no-ri"
alias g.cn="ping -c 1 g.cn >> /dev/null 2>&1 && echo 'You Are Connecting To The Internet Right now!'"
alias dict='dict -d wn'
alias info='info --vi-keys'
alias dock="killall Dock"
alias v='/Applications/MacPorts/MacVim.app/Contents/MacOS/Vim -p'
alias ri=qri
alias cmi="./configure && make && sudo make install"
alias update_macports="sudo port selfupdate && sudo port sync && sudo port outdated"
alias brew="/homebrew/bin/brew"

# http server
alias gembox="sudo gembox -p 8808 >> /dev/null 2>&1 &"
alias SimpleHTTPServer="/usr/bin/python -m SimpleHTTPServer >> /dev/null 2>&1 &" # port 8000
alias instiki_Documents="instiki -t='/Users/chenyuzai/Documents/instiki/storage'"
alias gemserver="gem server >> /dev/null 2>&1 &"

# mysql
alias start_mysql="/Library/StartupItems/MySQLCOM/MySQLCOM start"
alias stop_mysql="/Library/StartupItems/MySQLCOM/MySQLCOM stop"
alias restart_mysql="Library/StartupItems/MySQLCOM/MySQLCOM restart"

