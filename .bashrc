shopt -s checkwinsize
shopt -s expand_aliases
# Enable history appending instead of overwriting.  #139609
shopt -s histappend
# Combine multiline history into one
shopt -s cmdhist
# auto cd when entering a directory
# shopt -s autocd

HISTCONTROL=ignoreboth
export HISTIGNORE="&:l[sl]:[bf]g:exit:history:pwd:git status"
export HISTFILESIZE=200000
export HISTSIZE=100000


if [ "$color_prompt" = yes ]; then
    #PS1='\n${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ '
    export GIT_PS1_SHOWDIRTYSTATE=yes
    PS1='\n${debian_chroot:+($debian_chroot)} \[\033[01;34m\]\w\[\033[00m\]`__git_ps1` \$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
