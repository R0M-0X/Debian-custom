# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
# export LS_OPTIONS='--color=auto'
# eval "$(dircolors)"
# alias ls='ls $LS_OPTIONS'
# alias ll='ls $LS_OPTIONS -l'
# alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

PS1='\n\[\033[48;5;;38;5;240m\]╭╴(💀)\[\e[m\]\[\e[1m\]${debian_chroot:+($debian_chroot)}\[\e[m\]\[\e[3m\]\u\[\e[m\]\[\033[48;5;;38;5;243m\]\[\e[3m\]＠\[\e[m\]\[\e[3m\]\h\[\e[m\]\[\033[48;5;;38;5;249m\]\[\033[48;5;;38;5;239m\]\[[\033[48;5;;38;5;243m\]\[\e[3m\]\D{%m/%d/%Y %H:%M:%S}\[\e[m\]\[\033[48;5;;38;5;239m\]]\[\033[48;5;;38;5;240m\[\e[m\]\n\[\033[48;5;;38;5;239m\]╰⌊\[\e[3m\]\[\033[48;5;;38;5;247m\]\w\[\e[m\]\[\e[m\]\[\033[48;5;;38;5;239m\]⌋\[\033[00m\]\[\033[48;5;;38;5;196m\]→  \[\e[m\]';
