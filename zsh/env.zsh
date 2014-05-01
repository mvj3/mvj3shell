# export LANG
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Node.js
export CLANG=$HOME/bin
export NODE_PATH=/usr/local/lib/node

# Lines configured by zsh-newuser-install
export HISTFILE=$HOME/.histfile
export HISTSIZE=100000
export SAVEHIST=100000

# use Macvim or Gvim as the default editor
if [[ "Darwin" = "$(uname)" ]] ; then
  export EDITOR=mvim
  alias v=mvim
elif [[ "Linux" = "$(uname)" ]] ; then
  export EDITOR=gvim
  alias v=gvim
fi

# GIT
export EMAIL=`git config --get user.email`
export FULLNAME="`git config --get user.name`"
export SVN_EDITOR="mvim"
export VIM_APP_DIR="/Applications"
export GIT_USERNAME="$(git config --global --get user.name)"

# JAVA
export JAVA_HOME=$(/usr/libexec/java_home)

# /usr/local/bin rocks!
export PATH="/usr/local/bin:$PATH"
