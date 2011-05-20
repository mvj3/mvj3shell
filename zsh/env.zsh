# export PATH
export PATH=$HOME/.cabal/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:$PATH

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export CLANG=$HOME/bin
export NODE_PATH=/usr/local/lib/node

# Lines configured by zsh-newuser-install
export HISTFILE=~/.histfile
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

export EMAIL=`git config --get user.email`
export FULLNAME="`git config --get user.name`"
export SVN_EDITOR="mvim"
