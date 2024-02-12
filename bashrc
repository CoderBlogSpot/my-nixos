#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias cls='clear'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -al --color=auto'
alias nv='nvim'

export PATH=$PATH:$HOME/.local/bin:~/.cargo/bin

#Gruvbox Theme
#PS1='[\u@\h \W]\$ '
PS1='\[\e[0;1;38;5;28m\] Working \[\e[0;1;38;5;73m\]@ \[\e[0;1;38;5;214m\]\w \[\e[0;1;91m\]\$ \[\e[0m\]'
#PS1='\[\e[0;1;38;5;208m\][ \[\e[0;1;91m\]-\[\e[0;1;3;38;5;220m\]\W\[\e[0;1;91m\]- \[\e[0;1;38;5;208m\]] \[\e[0m\]'
#PS1='\[\e[0;1;38;5;255m\][\[\e[0;1;36m\]\h \[\e[0;1;38;5;202m\]\W\[\e[0;1;38;5;254m\]]\[\e[0;1;91m\]-\[\e[0;1;38;5;254m\](\[\e[0;1;38;5;214m\]\d\[\e[0;1;38;5;255m\])\n\[\e[0;1;38;5;28m\]\$ \[\e[0m\]'

#Nord/Onedark Teme
#PS1='[\u@\h \W]\$ '
#PS1="\[\e[33m\] Working\[\e[m\]\[\e[37m\] \[\e[m\]\[\e[32m\]in\[\e[m\]\[\e[37m\] \[\e[m\]\[\e[31m\]\w\[\e[m\]\[\e[37m\]\\$ \[\e[m\]"

#Solarized theme
#PS1='\[\e[38;5;106;1m\]\u\[\e[37m\] at \[\e[38;5;136m\]\h\[\e[38;5;160m\] in \[\e[38;5;202m\]\w\[\e[38;5;202m\]\$ \[\e[0m\]'
