## Environment Configuration

# lang
export LANG=ja_JP.UTF-8
#NG=ja_JP.UTF-8
#LC_CTYPE=ja_JP.UTF-8

# prompt
case ${UID} in
	0)
	PROMPT="%B%{[31m%}%/#%{[m%}%b "
	PROMPT2="%B%{[31m%}%_#%{[m%}%b "
	SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
	PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
	;;
	*)
	PROMPT="%{[31m%}%/%%%{[m%} "
	PROMPT2="%{[31m%}%_%%%{[m%} "
	SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
	PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
	;;
esac 
#PROMPT="[%n]%/ %% "
#PROMPT2="%_ %% "
#SPROMPT="%r is correct? [n,y,a,e]: " 

# auto change directory
setopt auto_cd

# auto directory pushed that you can get dirs list by cd -[tab]
setopt auto_pushd

# command correct edition before each completion attempt
setopt correct

# compacked complete list display
setopt list_packed

# no beep sound when complete list displayed
setopt nolistbeep

# keybind like vim
bindkey -v

# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history

# completion
autoload -U compinit
compinit
autoload predict-on
predict-on
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
alias ls="ls -G"
alias gls="gls --color"
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# terminal title
set terminal title including current directory
case "${TERM}" in
	kterm*|xterm)
	precmd() {
		echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
	}
	;;
esac 

# alias
alias vi=vim
alias v=vim
alias l=ls
alias c=cd

# editor 
export EDITOR=vim

zstyle ':completion:*:default' menu select=1
