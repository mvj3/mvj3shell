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
alias la="ls -aG"
if [[ "Darwin" = "$(uname)" ]] ; then
  alias ls="ls -pG"
elif [[ "Linux" = "$(uname)" ]] ; then
  alias ls="ls -pG --color"
fi
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
alias svn.ignore="SVN_EDITOR='vim' svn propedit svn:ignore ."
alias svn.check_ruby_syntax="ruby -r $HOME/utils/ruby/irb.rb -e 'CheckSyntax.ruby \"svn\"'"

# rails
alias t='autotest'
alias rr='rake routes | grep'
alias ss="ruby script/server thin -u"
alias sc='ruby script/console'
alias brain="o $HOME/Documents/rails_brain_2.3.4/index.html"

# screen
alias sl="screen -list"
alias sr="screen -r"
alias sS="screen -S"
alias sw="screen -wipe"

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
  alias dock="killall Dock"

  alias o="open"
  alias l='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'
  #alias update_macports="sudo port selfupdate && sudo port sync && sudo port outdated"
elif [[ "Linux" = "$(uname)" ]] ; then
  alias g="gnome-mplayer"

  alias o="gnome-open"
  alias l='gnome-screensaver-command --lock'
fi
alias p="ping"
alias i="curl -I"
alias c="curl -C - -O"
alias x="exit"
alias dict='dict -d wn'
alias info='info --vi-keys'
alias cmi="./configure && make && sudo make install"

# http server
alias SimpleHTTPServer="/usr/bin/python -m SimpleHTTPServer >> /dev/null 2>&1 &" # port 8000

# mysql
if [[ "Darwin" = "$(uname)" ]] ; then
  alias start_mysql="/Library/StartupItems/MySQLCOM/MySQLCOM start"
  alias stop_mysql="/Library/StartupItems/MySQLCOM/MySQLCOM stop"
  alias restart_mysql="Library/StartupItems/MySQLCOM/MySQLCOM restart"
fi

# music
alias music="ruby -r $HOME/utils/ruby/irb.rb -e 'Music.play'"
