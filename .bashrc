#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTTIMEFORMAT="%d/%m/%y %T "
HISTSIZE=100
HISTFILESIZE=-1

alias mv='mv -i'
alias mvit='mv -vit'
alias rm='rm -i'
alias cp='cp -i'
alias du='du -h'
alias df='df -h'
alias top='top -c'
alias ls='ls --color=auto'

export CCACHE_DIR="$HOME/.cache/ccache"
export EDITOR='emacs --no-desktop'
for i in /etc/ssl/certs/ca-bundle.crt \
	     /etc/ssl/certs/ca-certificates.crt
do
    [ -e "$i" ] && export SSL_CERT_FILE="$i"
done

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
