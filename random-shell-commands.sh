
xdotool getmouselocation

python -m pyftpdlib -w

sudo chown -R $USER ~/.blabla

youtube-dl -x --audio-format mp3 --audio-quality 4

GIT_SET_USER() {
  echo " setting username: $1";
  git config user.name "$1";

  echo " setting email: $2";
  git config user.email "$2";
}

KILL_BY_PORT_NUMBER() {
  sudo kill -9 $(sudo lsof -i :$1 -t)
}

GIT_PRINT_CURRENT_BRANCH() {
  var=$(git branch | grep -oP '\*\s*\K(\S+)')
  echo $var
  #git branch | grep \* | cut -d ' ' -f2}
}
