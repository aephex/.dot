[[ $- != *i* ]] && return

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

eval "$(starship init bash)"
eval "$(direnv hook bash)"

source ${HOME}/.config/aliases
source ${HOME}/.northernrc
source ${HOME}/.northernrc.custom
source ${HOME}/projects/nort/_nort-completions
source ${HOME}/nexus/docker/_nexus-completions
