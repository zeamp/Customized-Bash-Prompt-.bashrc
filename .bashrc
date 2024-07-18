# ~/.bashrc customized by zeamp (07182024)
# Color bash prompt and root warning message.
# Written for Debian Linux and others.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Enable color support for ls and add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
fi

# Set a fancy prompt (non-color, overwrite the one in /etc/bash.bashrc)
# PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

# The following prompt setup adds a color prompt with cyan user and hostname, bright black @ symbol, grey directory path, followed by the current time in 12-hour format with AM/PM.
PS1='\[\033[0;36m\]\u\[\033[1;90m\]@\[\033[0;36m\]\h\[\033[0m\]:\[\033[0;37m\]\w\[\033[0m\] \[\033[0;36m\]\@ \[\033[0m\]\$ '

# Display a special message when the user becomes root
if [ "$EUID" -eq 0 ]; then
    echo -e "\033[1;31mWARNING: You are logged in as root!\033[0m"
fi

# Enable bash completion in interactive shells
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Alias definitions.
# You may want to put all your additions into a separate file like ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# You can include extra things below here:
