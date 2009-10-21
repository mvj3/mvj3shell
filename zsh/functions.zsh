# grep a pattern which is't inincluded in .svn files
function grep_svn {
  grep $1 -rn . | grep -v svn | less
}

# 过滤以#开头的行和空白行
function grep_conf {
  #awk '{if(NF>0) print $0}' $1 | grep -v '^#'  | less
  #awk '!/^$/' $1 | grep -v '^#'  | less
  #awk '!/./' $1 | grep -v '^#'  | less
  awk 'NF' $1 | grep -v '^#'  | less
}
