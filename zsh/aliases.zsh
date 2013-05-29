# achive the same function on different platforms of the different procedures
if [[ "Darwin" = "$(uname)" ]] ; then
  MVJ3_CLIPBOARD="pbcopy"
elif [[ "Linux" = "$(uname)" ]] ; then
  MVJ3_CLIPBOARD="xclip"
fi
# file utility
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
alias gx='open -a GitX'
alias gi="ruby -r $HOME/utils/ruby/irb.rb -e 'GitHub.clone'"
alias gsearch="ruby -r $HOME/utils/ruby/irb.rb -e 'GitHub.search'"
alias git.check_ruby_syntax="ruby -r $HOME/utils/ruby/irb.rb -e 'CheckSyntax.ruby \"git status -s\"'"
alias git.log="git log --author '$GIT_USERNAME' --no-merges --after={1.day.ago} | cat | grep -v '^commit ' | grep -v '^Author: ' | grep -v '^Date: ' | grep -v '^$' | tail -r"

# svn
alias svn.ignore="svn propedit svn:ignore ."
alias svn.check_ruby_syntax="ruby -r $HOME/utils/ruby/irb.rb -e 'CheckSyntax.ruby \"svn status\"'"

# rails
alias t='autotest'
alias rr='rake routes | grep'
alias pro="export RAILS_ENV=production;"
alias dev="export RAILS_ENV=development;"

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
  alias oo="open http://www.google.com"
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

# music
alias music="ruby -r $HOME/utils/ruby/irb.rb -e 'Music.play'"

# ruby
#alias rubygem="cd `rvm info homes | grep 'gem:' | awk -F '"' '{print $2}'`/gems"
#alias rubylib="cd `rvm info homes | grep 'ruby:' | awk -F '"' '{print $2}'`/lib/ruby/1.8"
alias b="bundle exec "


# use custom python setup
alias pip="/usr/local/share/python/pip"
alias pygmentize="/usr/local/share/python/pygmentize"
