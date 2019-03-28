# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

#load .bashrc
#emulate sh
#if [ -f ~/.bashrc ]; then
#source ~/.bashrc
#fi
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="ys"
#ZSH_THEME="agnoster"
#ZSH_THEME="gianu"
#ZSH_THEME="maran"

# theme "ys" config
#PROMPT="
#%{$terminfo[bold]$fg[blue]%}%{$reset_color%}\
#%(#,%{$bg[yellow]%}%{$fg[black]%}%n%{$reset_color%},%{$fg[cyan]%}%n)\
#%{$fg[green]%}@\
#%{$fg[green]%}%m\
#%{$fg[white]%}:\
#%{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}\
#${hg_info}\
#${git_info}\
 #\
#%{$fg[white]%}[%*] $exit_code
#%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlightinga
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

#Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
  #export EDITOR='vim'
#else
  #export EDITOR='mvim'
#fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


#settings migrated from .bashrc
#includign alias and software paths
#
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias L='ls'
alias LS='ls'
alias Ls='ls'
alias CD='cd'

#setting for delta
export deltaHome=$HOME/delta
export deltaCalc=$deltaHome/calc
export deltaBin=$deltaHome/bin
export DELTA_ARCH=`$deltaBin/delta_arch`
##delta tools
export PATH=/home/zt/delta/tools/bin:$PATH

#openmpi
export PATH=/usr/software/openmpi/bin:$PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/software/openmpi/lib

#tecplot 2010
export TEC_360_2010=/usr/software/tecplot
export PATH=$TEC_360_2010/bin:$PATH
export TECPHYFILE=./.tecplot.phy
export XLIB_SKIP_ARGB_VISUALS=1
#tecplot 2017
alias tec2017='/usr/local/tecplot/360ex_2017r2/bin/tec360'

#FlameMaster
source ~/FlameMaster/Bin/bin/Source.zsh

#Gambit
export PATH=/usr/software/Fluent.Inc/bin:$PATH

#ANSYS
##ANSYS--15.0
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
##ansys help
alias ansyshelp='/usr/ansys_inc/v182/Tools/mono/Linux64/bin/mono /usr/ansys_inc/v182/commonfiles/help/HelpViewer/ANSYSHelpViewer.exe'
##icem18.2
alias icem18="/usr/ansys_inc/v182/icemcfd/linux64_amd/bin/icemcfd"
##Fluent 18.2
export PATH=/usr/ansys_inc/v182/fluent/bin:$PATH

#ArchiSteamFarm
alias asf="~/Documents/software/asf/ArchiSteamFarm"
#SSR
ssrdir='/home/zt/Documents/software/ss/ssr/shadowsocksr/shadowsocks'
alias ssr="python $ssrdir/local.py -c $ssrdir/../../ssr.json"

#OpenFOAM
alias sourceof="source ~/OpenFOAM/OpenFOAM-2.3.0/etc/bashrc && export LIB_FLAMELET_SRC=~/OpenFOAM/flameletFoam/src/"

#youtube-dl
alias ytf='youtube-dl --list-formats'
alias ytd='youtube-dl -f'

#texlive-2017
export PATH=/usr/local/texlive/2017/bin/x86_64-linux:$PATH
export MANPATH=/usr/local/texlive/2017/texmf-dist/doc/man:$MANPATH

#gfortran compiler short
alias gfm='gfortran -mcmodel=medium'
