alias a='. ~/projects/ytec-tooling/usr/local/bin/ssh-agent-attach.sh'
alias e='. ~/projects/ytec-tooling/empower.sh'
alias d='ssh -A -X duivenkracht.ytec.nl'
alias i='~/bin/mkissuedir'
alias s='synergize'
alias t='~/bin/tmux-ticket'
alias y="echo '$(tput setaf 4)$(tput bold)Initalizing YTEC environment…$(tput sgr0)'; a && ssh-add && e && s"
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
