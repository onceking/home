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
