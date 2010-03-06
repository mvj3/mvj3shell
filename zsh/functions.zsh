# grep a pattern which is't inincluded in .svn files
gsvn() {
  grep $1 -rn . | grep -v svn | less
}

# filter the lines which begin with # and blank lines
gconf() {
  #awk '{if(NF>0) print $0}' $1 | grep -v '^#'  | less
  #awk '!/^$/' $1 | grep -v '^#'  | less
  #awk '!/./' $1 | grep -v '^#'  | less
  awk 'NF' $1 | grep -v '^#'  | less
}

# shell prompt
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo "[%{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}] "
  fi
}

export_git_prompt() {
  export PROMPT='%{$fg_bold[red]%}世界的审美！ %{$fg[cyan]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}% %{$reset_color%}%(!.#.$) '
}

export_no_git_prompt() {
  if [[ "Darwin" = "$(uname)" ]] ; then
    export PROMPT='%{$fg_bold[red]%}世界的审美！ %{$fg[cyan]%}%~ %{$fg_bold[blue]%}% %{$reset_color%}%(!.#.$) '
  elif [[ "Linux" = "$(uname)" ]] ; then
    export PROMPT='%{$fg_bold[red]%}贱兔！ %{$fg[cyan]%}%~ %{$fg_bold[blue]%}% %{$reset_color%}%(!.#.$) '
  fi
}

#GIT_PROMPT_PREFIX="%{$fg[blue]%}["
#GIT_PROMPT_SUFFIX="%{$reset_color%} "
#GIT_PROMPT_DIRTY="%{$fg[blue]%}]%{$fg[red]%}⚡%{$reset_color%}"
#GIT_PROMPT_CLEAN="%{$fg[blue]%}]"

#parse_git_dirty () {
  #if [[ $((git status 2> /dev/null) | tail -n1) != "nothing to commit (working directory clean)" ]]; then
    #echo "$GIT_PROMPT_DIRTY"
  #else
    #echo "$GIT_PROMPT_CLEAN"
  #fi
#}

#git_prompt_info() {
  #ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  #echo "$GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$GIT_PROMPT_SUFFIX"
#}
