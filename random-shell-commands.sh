
xdotool getmouselocation

python -m pyftpdlib -w

sudo chown -R $USER ~/.blabla

youtube-dl -x --audio-format mp3 --audio-quality 4
youtube-dl -f bestaudio --no-playlist -q -x --audio-format "best" --audio-quality 2

touch -t "$(date +%Y%m%d%H%M.%S)" *.opus
# git authors sorted by LOC
git log --no-merges --pretty=format:%an --numstat | awk '/./ && !author { author = $0; next } author { ins[author] += $1; del[author] += $2 } /^$/ { author = ""; next } END { for (a in ins) { printf "%10d %10d %10d %s\n", ins[a] - del[a], ins[a], del[a], a } }' | sort -rn
