#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias mv='mv -i'
alias mvit='mv -vit'
alias rm='rm -i'
alias cp='cp -i'
alias du='du -h'
alias df='df -h'
alias top='top -c'
alias ls='ls --color'

export CCACHE_DIR="$HOME/.cache/ccache"
export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
export EDITOR='emacs --no-desktop'

export PS1='[\u@\h \W]\$ '
for i in /usr/share/git-core/contrib/completion/git-prompt.sh \
	     /usr/share/git/completion/git-prompt.sh
do
    if [ -e "$i" ]
    then
	source "$i"
	export GIT_PS1_SHOWCOLORHINTS=1
	export GIT_PS1_SHOWDIRTYSTATE=1     # *
	export GIT_PS1_SHOWUNTRACKEDFILES=1 # %
	export GIT_PS1_SHOWUPSTREAM=auto    # <=>
	export PROMPT_COMMAND='__git_ps1 "[\u@\h] \w" "\\\$ "'

	break
    fi
done

envfile="$HOME/.gnupg/gpg-agent.env"
if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
    eval "$(cat "$envfile")"
else
    eval "$(gpg-agent --daemon --enable-ssh-support --write-env-file "$envfile")"
fi
export GPG_AGENT_INFO  # the env file does not contain the export statement
export SSH_AUTH_SOCK   # enable gpg-agent for ssh
