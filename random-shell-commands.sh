
xdotool getmouselocation

python -m pyftpdlib -w

sudo chown -R $USER ~/.blabla

# update create date
touch -t "$(date +%Y%m%d%H%M.%S)" *.opus

# git authors sorted by LOC
git log --no-merges --pretty=format:%an --numstat | awk '/./ && !author { author = $0; next } author { ins[author] += $1; del[author] += $2 } /^$/ { author = ""; next } END { for (a in ins) { printf "%10d %10d %10d %s\n", ins[a] - del[a], ins[a], del[a], a } }' | sort -rn

# youtube-dl -f bestaudio --no-playlist -q -x --audio-format "best" --audio-quality 2
# youtube-dl -x --audio-format mp3 --audio-quality 4
DOWNLOAD_AUDIO() {
  yt-dlp -f bestaudio --no-playlist -q -x --audio-format "best" --audio-quality 2 "$1"
}

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

GIT_REBASE_MASTER() {
  git checkout master && git pull && git checkout - && git rebase master
}

KILL_BY_PORT_NUMBER() {
  sudo kill -9 $(sudo lsof -i :$1 -t)
}

KILL_BY_PORT_NUMBER() {
  for var in "$@"
  do
    sudo kill -9 $(sudo lsof -i :$var -t)
  done
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
