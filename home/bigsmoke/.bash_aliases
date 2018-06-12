alias a='. ~/projects/ytec-tooling/usr/local/bin/ssh-agent-attach.sh'
alias e='. ~/projects/ytec-tooling/empower.sh'
alias d='ssh -A -X duivenkracht.ytec.nl'
alias de='echo "$(tput setaf 4)$(tput bold)Going on Pidgeon Power—duivenkracht!$(tput sgr0)"; ssh -A -X -t duivenkracht.ytec.nl ". ~/projects/ytec-tooling/empower.sh; bash"'
alias i='~/bin/mkissuedir'
alias s='synergize'
alias t='~/bin/tmux-ticket'
alias y="echo '$(tput setaf 4)$(tput bold)Initalizing YTEC environment…$(tput sgr0)'; a; echo 'Loading ssh-agent default key [ssh-add]…'; ssh-add; e; s"
alias tmux='tmux -2'
export EDITOR=nvim
alias vim="$EDITOR"
alias vi="$EDITOR"
alias cdfab="cd ~/projects/ytec-tooling/usr/local/lib/python/ytec_fabric"
alias verynice="nice -n 19 ionice -n 7"
export PATH=~/bin:~/.local/bin:$PATH

if [ -x "$HOME/projects/ytec-tooling/usr/local/bin/ssh-agent-attach.sh" ]; then
    a
fi

. ~/.bash_prompt
. ~/.bash_extras
