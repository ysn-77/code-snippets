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
