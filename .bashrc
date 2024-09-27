# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	;;
*) ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# nice to aliases
alias vim='nvim'
alias c='clear'
alias lg='lazygit'
alias bashrc='vim ~/.bashrc'
alias reload='source ~/.bashrc'
alias ggs='git status'
alias gaa='git add -u'
alias gga='git add'
alias gcm='git commit -m'
alias gpp='git push'
alias ggp='git pull'
alias giff='git diff'
alias python="python3"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias vi='vim'
alias rs='. ~/.bashrc'
alias rc='vim ~/.bashrc'
alias ansi='ssh adm-joped@dc1-ansi002.systematicgroup.local'
alias bb='ssh adm-joped@bitbucket.systematicgroup.local'
alias bbe='ssh adm-joped@bitbucket-ext.systematic.com'
alias bbm='ssh adm-joped@buc-bitb001.systematicgroup.local'

alias tbb='ssh adm-joped@tbitbucket.systematicgroup.local'
alias tbbe='ssh adm-joped@dc1-bitb006.systematicgroup.local'
alias nxs='ssh adm-joped@dc1-nexs004.systematicgroup.local'
alias nxsd='ssh adm-joped@dc1-nexs006.systematicgroup.local'
alias nxse='ssh adm-joped@dc1-nexs005.sgdmz.local'
alias nxst='ssh adm-joped@dc1-nexs003.systematicgroup.local'
alias sq='ssh adm-joped@sonarqube.systematicgroup.local'
# alias sup='ssh adm-joped@support.systematic.com'

alias sup='ssh -i ~/.ssh/jira jira@dc1-jira004.sgdmz.local'
alias tsup='ssh adm-joped@tsupport.systematic.com'
alias jp='ssh -i ~/.ssh/jira jira@jira-prod.systematicgroup.local'
alias tjp='ssh -i ~/.ssh/jira jira@tjira-prod.systematicgroup.local'
alias tf='terraform'
alias tsq='ssh adm-joped@tsonarqube.systematicgroup.local'
alias twiki='ssh adm-joped@twiki.systematicgroup.local'
alias wiki='ssh adm-joped@wiki.systematicgroup.local'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi
. "$HOME/.cargo/env"

# java stuff
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export JAVA_HOME
export JRE_HOME
export PATH=$PATH:$JAVA_HOME/bin

# kubectl setup
source <(kubectl completion bash)
alias k=kubectl
complete -o default -F __start_kubectl k

# fnm
FNM_PATH="/home/joped/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
	export PATH="$FNM_PATH:$PATH"
	eval "$(fnm env)"
fi

eval "$(zoxide init bash --cmd cd)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
