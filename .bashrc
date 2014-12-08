#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

alias mv='mv -i'
alias mvit='mv -vit'
alias rm='rm -i'
alias cp='cp -i'
alias du='du -h'
alias df='df -h'
alias top='top -c'
alias ls='ls --color'

export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt


envfile="$HOME/.gnupg/gpg-agent.env"
if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
    eval "$(cat "$envfile")"
else
    eval "$(gpg-agent --daemon --enable-ssh-support --write-env-file "$envfile")"
fi
export GPG_AGENT_INFO  # the env file does not contain the export statement
export SSH_AUTH_SOCK   # enable gpg-agent for ssh
