GOPATH=$(go env GOPATH)
export GOPATH

PATH=$(tr -d $'\n ' <<< "
    $GOPATH/bin:
    $HOME/.config/polybar/scripts:
    $HOME/.local/bin:
    $HOME/nexus/scripts:
    $HOME/projects/scripts:
    $PATH
")
export PATH

export DIRENV_LOG_FORMAT=

export EDITOR=/usr/local/bin/vim # Symlinked to NVim
export VISUAL=/usr/local/bin/vim
