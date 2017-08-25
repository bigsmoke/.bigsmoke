alias a='. ~/projects/ytec-tooling/usr/local/bin/ssh-agent-attach.sh'
alias e='. ~/projects/ytec-tooling/empower.sh'
alias d='ssh -A -X duivenkracht.ytec.nl'
alias i='~/bin/mkissuedir'
alias s='synergize'
alias t='~/bin/tmux-ticket'
alias tmux='tmux -2'
if [ -x "$HOME/bin/nvim.appimage" ]; then
    alias nvim=~/bin/nvim.appimage
else
    unalias nvim
fi
alias vim='nvim'
alias vi='nvim'
export PATH=~/bin:~/.local/bin:$PATH
export EDITOR=nvim

if [ -x "$HOME/projects/ytec-tooling/usr/local/bin/ssh-agent-attach.sh" ]; then
    a
fi

. ~/.bash_prompt
. ~/.bash_extras
