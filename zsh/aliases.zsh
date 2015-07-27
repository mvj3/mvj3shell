# achive the same function on different platforms of the different procedures
if [[ "Darwin" = "$(uname)" ]] ; then
  MVJ3_CLIPBOARD="pbcopy"
elif [[ "Linux" = "$(uname)" ]] ; then
  MVJ3_CLIPBOARD="xclip"
fi

# file utility
alias gwd="pwd | $MVJ3_CLIPBOARD"

# git
alias gx='open -a GitX'
alias gi="ruby -r $mvj3shell_home/ruby/irb.rb -e 'GitHub.clone'"
alias gsearch="ruby -r $mvj3shell_home/ruby/irb.rb -e 'GitHub.search'"
alias 'git.log'="git log --author '$GIT_USERNAME' --no-merges --after={10.hour.ago} | cat | grep -v '^commit ' | grep -v '^Author: ' | grep -v '^Date: ' | grep -v '^$' | tail -r"

# hg
alias hgs="hg status"
alias hgd="hg diff"

# program launch
if [[ "Darwin" = "$(uname)" ]] ; then
  alias lock='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'
elif [[ "Linux" = "$(uname)" ]] ; then
  alias lock='gnome-screensaver-command --lock'
fi

# http server
alias SimpleHTTPServer="python -m SimpleHTTPServer >> /dev/null 2>&1 &" # port 8000
