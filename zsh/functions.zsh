function grep_svn {
  `grep '$1' -rn . | grep -v svn | less`
}
