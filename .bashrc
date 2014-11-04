# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

## set editors
export GIT_EDITOR="/usr/bin/vim"
export EDITOR="/usr/bin/vim"
export SUDO_EDITOR="/usr/bin/vim"

## For emacs-for-python
export PYMACS_PYTHON=python2

## For .pyrc
export PYTHONSTARTUP="$HOME/.pyrc"

## add Android SDK to $PATH
PATH="/opt/android-sdk/platform-tools:/opt/android-sdk/tools:$HOME/bin:$PATH:"
## add Java jre in /opt to $PATH
PATH="/opt/java/jre/bin:$PATH"

## add Matlab bin to path
PATH="/opt/MATLAB/MATLAB_Production_Server/R2013a/bin":$PATH

## add ruby gems to path
PATH="$PATH:$HOME/.gem/ruby/2.0.0/bin"

## add PATH for crosstool-ng toolchains
PATH="$PATH:/home/aaron/x-tools/arm-unknown-linux-gnueabi/bin:/home/aaron/x-tools/mipsel-unknown-linux-gnu/bin"

## Maven vars
M2_HOME="/opt/maven/"

## fun stuff
#command cowsay $(fortune)

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#xterm-color)
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#    ;;
#*)
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#    ;;
#esac

# Created by James Manning <jmm@raleigh.ibm.com>
# Changed by Spidey 08/06
function combo {
PS1="\[\033[01;34;01m\]\333\262\261\260\[\033[01;37;44m\]\u@\h\[\033[00;34;40m\]\260\261\262\333\[\033[00;34;40m\]\333\262\261\260\[\033[01;37;40m\]\d \$(date +%I:%M:%S%P)\n\[\033[01;33;40m\]$PWD>\[\033[00m\] "
PS2="\[\033[01;34;01m\]\333\262\261\260\[\033[00;34;40m\]\260\261\262\333\[\033[00;34;40m\]\333\262\261\260\[\033[01;01;34m\]>\[\033[00m\] 
"
}

# Comment in the above and uncomment this below for a color prompt
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi


# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

## aliases
export GREP_COLOR='1;37;41'
alias grep='grep --color=auto'
alias ping='ping -c 5'
alias ..='cd ..'
alias reboot='sudo reboot'
alias halt='sudo halt'
alias poweroff='sudo poweroff'
#alias umount='sudo umount -a'
#alias mount='sudo mount -a'
alias omv='ssh aaron@aabmass.it.cx'
alias deb='ssh aaron@kleiman.mooo.com'
alias oce='ssh root@192.81.211.96'
alias oce-cher='ssh root@192.81.211.96 -L 9090:localhost:9090'
#alias rmdir='sudo rm -rf'
alias rmlock='sudo rm /var/lib/pacman/db.lck'
alias kexec-reboot='sudo kexec-reboot'
alias rc.d='sudo rc.d'
alias userlist='cat /etc/passwd | cut -d":" -f1 '
alias psx='ps x | grep'
alias puter='ssh aaron@192.168.2.205'
alias pix='ssh aaron@pixelmon.us'
alias aptup='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get autoremove'
alias powersave='sudo cpupower frequency-set -g powersave'
alias performance='sudo cpupower frequency-set -g performance'
alias ondemand='sudo cpupower frequency-set -g ondemand'
alias craftbukkit='sudo -u craftbukkit /./srv/craftbukkit/craftbukkit.sh'
alias tekkit_srv='sudo -u craftbukkit /./home/craftbukkit/tekkit/tekkit.sh'
alias pgr='ps ax | grep'
alias restnet='sudo systemctl restart NetworkManager.service'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

## functions

function cd()
{
 builtin cd "$*" && ls
}

function e()      # Handy Extract Program.
{
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xvjf $1     ;;
             *.tar.gz)    tar xvzf $1     ;;
             *.bz2)       bunzip2 $1      ;;
             *.rar)       unrar x $1      ;;
             *.gz)        gunzip $1       ;;
             *.tar)       tar xvf $1      ;;
             *.tbz2)      tar xvjf $1     ;;
             *.tgz)       tar xvzf $1     ;;
             *.zip)       unzip $1        ;;
             *.Z)         uncompress $1   ;;
             *.7z)        7z x $1         ;;
             *)           echo "'$1' cannot be extracted via >extract<" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
