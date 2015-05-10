# conf-sync managed

# conf-sync begin-section=custom
unset command_not_found_handle
export PATH="${HOME}/bin:$PATH"
export LC_ALL="en_US.UTF-8"
export LC_TIME="en_DK.utf8"
export LC_PAPER="en_DK.utf8"

type -t rar || [ "$(type -t unrar)" == "file" ] && alias rar=unrar

[[ -n "$DISPLAY" && "$TERM" = "xterm" ]] && export TERM=xterm-256color 

export PYTHONWARNINGS=default

export BROWSER="firefox"
# conf-sync end-section
