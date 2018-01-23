# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
#commented for zsh
#shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
#commented for zsh
#shopt -s checkwinsize

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
    xterm-color) color_prompt=yes;;
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
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias L='ls'
alias LS='ls'
alias Ls='ls'
alias CD='cd'

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
# commented for zsh
#if ! shopt -oq posix; then
  #if [ -f /usr/share/bash-completion/bash_completion ]; then
    #. /usr/share/bash-completion/bash_completion
  #elif [ -f /etc/bash_completion ]; then
    #. /etc/bash_completion
  #fi
#fi

#############################################################

#add  ifort & icc
#source /home/zt/software/intel/compilers_and_libraries_2017.0.098/linux/bin/ifortvars.sh intel64
#source /home/zt/software/intel/compilers_and_libraries_2017.0.098/linux/bin/iccvars.sh intel64
#end ifort & icc



#setting for delta
	export deltaHome=$HOME/delta
	export deltaCalc=$deltaHome/calc
	export deltaBin=$deltaHome/bin
	export DELTA_ARCH=`$deltaBin/delta_arch`
#symbol'' from "~`"button
#setting alias
	#alias delta="$DELTA_HOME/bin/delta" 
## end setting for delta


#openmpi
export PATH=/usr/software/openmpi/bin:$PATH
#export PATH=/usr/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/software/openmpi/lib
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/openmpi/lib
#openmpi end

#terminal color
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#terminal color end


#tecplot
export TEC_360_2010=/usr/software/tecplot
export PATH=$TEC_360_2010/bin:$PATH
export TECPHYFILE=./.tecplot.phy
export XLIB_SKIP_ARGB_VISUALS=1
#tecplot end

#tecplot 2017
alias tec2017='/usr/local/tecplot/360ex_2017r2/bin/tec360'
#tecplot 2017 end


#Gambit
export PATH=/usr/software/Fluent.Inc/bin:$PATH

##ansys
##ANSYS
#PATH=/usr/software/ansys_inc/v150/ansys/bin:$PATH
#export PATH
##CFX
#PATH=/usr/software/ansys_inc/v150/CFX/bin:$PATH
#export PATH
##FLUENT
#PATH=/usr/software/ansys_inc/v150/fluent/bin:$PATH
#export PATH
##ICEM
#PATH=/usr/software/ansys_inc/v150/icemcfd/linux64_amd/bin:$PATH
#export PATH
##WORKBENCH
#PATH=/usr/software/ansys_inc/v150/Framework/bin/Linux64:$PATH
#export PATH
##TurboGrid
#PATH=/usr/software/ansys_inc/v150/TurboGrid/bin:$PATH
#export PATH
##ANSYS Sevice Manager
#PATH=/usr/software/ansys_inc/shared_files/licensing/lic_admin:$PATH
#export PATH
###ansys end

#workbench
PATH=/usr/ansys_inc/v182/Framework/bin/Linux64:$PATH
export PATH
#fluent
PATH=/usr/ansys_inc/v182/fluent/bin:$PATH
export PATH

alias ansyshelp='/usr/ansys_inc/v182/Tools/mono/Linux64/bin/mono /usr/ansys_inc/v182/commonfiles/help/HelpViewer/ANSYSHelpViewer.exe'
#icem18.2
alias icem18="/usr/ansys_inc/v182/icemcfd/linux64_amd/bin/icemcfd"
#alias fluent18="/usr/ansys_inc/v182/fluent/bin/fluent"

#icem18.2



#chemkin
#source /home/zt/software/reaction/chemkin15083_linuxx8664/bin/chemkin_setup.ksh
#chemkin end

#UG NX8.5
#export UGII_LANG=simpl_chinese
#UGII_BASE_DIR=/usr/software/Siemens/ugs085; export UGII_BASE_DIR
#UGII_ROOT_DIR=/usr/software/Siemens/ugs085/ugii; export UGII_ROOT_DIR
#UGS_LICENSE_SERVER=28000@523hp; export UGS_LICENSE_SERVER
UGII_JAVA_HOME=/usr/bin/java
#UG end

#FlameMaster
source ~/FlameMaster/Bin/bin/Source.bash

#capital not
#zsh
#bind "set completion-ignore-case on"

#alias icem='ibus exit && icemcfd'

#delta tools
export PATH=/home/zt/delta/tools/bin:$PATH

#ArchiSteamFarm
alias asf="~/Documents/software/asf/ArchiSteamFarm"
alias ssr="cd /home/zt/Documents/software/ss/ssr/shadowsocksr/shadowsocks && python local.py -c ../../ssr.json"


#OpenPALM
function prepalm {
export PREPALMMPDIR=/home/zt/Documents/les/CFD_code/OpenPALM/PrePALM_MP
$PREPALMMPDIR/prepalm_MP.tcl $∗ &
}

#OpenFOAM
alias sourceof="source ~/OpenFOAM/OpenFOAM-2.3.0/etc/bashrc && export LIB_FLAMELET_SRC=~/OpenFOAM/flameletFoam/src/"
#end

export PREPALMEDITOR=gvim

#youtube-dl
alias ytf='youtube-dl --list-formats'
alias ytd='youtube-dl -f'

#texlive-2017
export PATH=/usr/local/texlive/2017/bin/x86_64-linux:$PATH
export MANPATH=/usr/local/texlive/2017/texmf-dist/doc/man:$MANPATH

#gfortran compiler short
alias gfm='gfortran -mcmodel=medium'
