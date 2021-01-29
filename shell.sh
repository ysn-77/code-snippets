GIT_PRINT_CURRENT_BRANCH() {
  var=$(git branch | grep \*)
  echo $var
  #git branch | grep \* | cut -d ' ' -f2}
}

GIT_SET_USER() {
  echo " setting username: $1";
  git config user.name "$1";

  echo " setting email: $2";
  git config user.email "$2";
}

KILL_BY_PORT_NUMBER() {
  sudo kill -9 $(sudo lsof -i :$1 -t)
}

#archive extractor
ex() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
