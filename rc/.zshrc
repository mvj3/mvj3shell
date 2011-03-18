source /etc/profile

# load zsh locale
source $HOME/utils/zsh/env.zsh

# load zsh function
source $HOME/utils/zsh/functions.zsh

# load zsh aliases
source $HOME/utils/zsh/aliases.zsh

# load zsh setopt
source $HOME/utils/zsh/setopt.zsh

source $HOME/utils/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/utils/zsh/git-flow-completion/git-flow-completion.zsh


autoload -Uz compinit
compinit

# vi editing mode is awesome!
bindkey -v

autoload -U colors
colors

title()   { print -Pn "\e]0;$*\a" }
precmd()  { title "$0" }
preexec() { title "$1" }

# disable git prompt
export_no_git_prompt

# enable rvm
[[ -s /usr/local/lib/rvm ]] && source /usr/local/lib/rvm
