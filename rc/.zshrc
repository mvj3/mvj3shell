source /etc/profile

# load zsh function
source $HOME/utils/zsh/functions.zsh

# load zsh aliases
source $HOME/utils/zsh/aliases.zsh

# load zsh setopt
source $HOME/utils/zsh/setopt.zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

autoload -Uz compinit
compinit

# use Macvim or Gvim as the default editor
if [[ "Darwin" = "$(uname)" ]] ; then
  export EDITOR=mvim
  alias v=mvim
elif [[ "Linux" = "$(uname)" ]] ; then
  export EDITOR=gvim
  alias v=gvim
fi

# vi editing mode is awesome!
bindkey -v

# export PATH
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/sbin:$PATH

autoload -U colors
colors

title()   { print -Pn "\e]0;$*\a" }
precmd()  { title "$0" }
preexec() { title "$1" }

# disable git prompt
export_no_git_prompt

# enable rvm
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
