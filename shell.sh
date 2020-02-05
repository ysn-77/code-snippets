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
