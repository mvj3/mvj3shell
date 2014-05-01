# achive the same function on different platforms of the different procedures
if [[ "Darwin" = "$(uname)" ]] ; then
  MVJ3_CLIPBOARD="pbcopy"
elif [[ "Linux" = "$(uname)" ]] ; then
  MVJ3_CLIPBOARD="xclip"
fi
# file utility
alias gwd="pwd | $MVJ3_CLIPBOARD"
alias rm-DS_Store="find . -name '.DS_Store' -exec rm '{}' \;"
alias rm-Dot_svn="find . -name '.svn' -exec rm -rf '{}' \;"

# git
alias gx='open -a GitX'
alias gi="ruby -r $HOME/utils/ruby/irb.rb -e 'GitHub.clone'"
alias gsearch="ruby -r $HOME/utils/ruby/irb.rb -e 'GitHub.search'"
alias git.log="git log --author '$GIT_USERNAME' --no-merges --after={10.hour.ago} | cat | grep -v '^commit ' | grep -v '^Author: ' | grep -v '^Date: ' | grep -v '^$' | tail -r"
alias gd='git diff'
alias gD='gd --cached'

# svn
alias svn.ignore="svn propedit svn:ignore ."

# program launch
if [[ "Darwin" = "$(uname)" ]] ; then
  alias xulrunner="/Library/Frameworks/XUL.framework/xulrunner-bin "
  alias hibernateon='sudo pmset -a hibernatemode 1'
  alias hibernateoff='sudo pmset -a hibernatemode 0'
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
alias dict='dict -d wn'
alias info='info --vi-keys'
alias cmi="./configure && make && sudo make install"

# http server
alias SimpleHTTPServer="/usr/bin/python -m SimpleHTTPServer >> /dev/null 2>&1 &" # port 8000

# music
alias music="ruby -r $HOME/utils/ruby/irb.rb -e 'Music.play'"
