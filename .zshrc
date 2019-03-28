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
#ZSH_THEME="ys"
ZSH_THEME="agnoster"
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
DISABLE_AUTO_UPDATE="true"

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
  autojump
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
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh
#

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
#export deltaHome=$HOME/delta
#export deltaCalc=$deltaHome/calc
#export deltaBin=$deltaHome/bin
#export DELTA_ARCH=`$deltaBin/delta_arch`
##delta tools
#export PATH=/home/zt/delta/tools/bin:$PATH

#openmpi
#export PATH=/usr/software/openmpi/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

#tecplot
export TEC_360_2017=/usr/local/tecplot/360ex_2017r2/bin
export PATH=$TEC_360_2017/bin:$PATH
export TECPHYFILE=./.tecplot.phy
export XLIB_SKIP_ARGB_VISUALS=1
#tecplot 2017
alias tec2017='/usr/local/tecplot/360ex_2017r2/bin/tec360'

alias tec18='/opt/tecplot/360ex_2018r2/bin/tec360'
#export LD_LIBRARY_PATH="/usr/local/tecplot/360ex_2018r1/bin:/usr/local/tecplot/360ex_2018r1/bin/sys${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

#ensight
export CEI_HOME="/opt/CEI"
export PATH=$CEI_HOME/bin:$PATH

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

alias icem19="/home/zt/software/ansys_inc/v191/icemcfd/linux64_amd/bin/icemcfd"
alias ansys19='export PATH=/home/zt/software/ansys_inc/v191/fluent/bin:$PATH'

#ArchiSteamFarm
alias asf="mono ~/software/ASF/ASF.exe"

#minecraft
#alias mc="java -jar ~/software/minecraft/launcher.jar"
#
#SSR
ssrdir='/home/zt/Documents/software/shadowsocksr/shadowsocks'
alias ssr="python $ssrdir/local.py -c $ssrdir/../do.json"

#OpenFOAM
#alias srceof="source ~/OpenFOAM/OpenFOAM-2.3.0/etc/bashrc && export LIB_FLAMELET_SRC=~/OpenFOAM/flameletFoam/src/"
alias srcof23="source ~/OpenFOAM/OpenFOAM-2.3.0/etc/bashrc"
#alias srcof40="source /opt/openfoam6/etc/bashrc"
#alias srcfe40="source ~/OpenFOAM/foam-extend-4.0/etc/zshrc"

#youtube-dl
alias ytf='youtube-dl --list-formats'
alias ytd='youtube-dl -f'

#texlive-2017
export PATH=/usr/local/texlive/2018/bin/x86_64-linux:$PATH
export MANPATH=/usr/local/texlive/2018/texmf-dist/doc/man:$MANPATH

#gfortran compiler short
alias gfm='gfortran -mcmodel=medium'

#terminal 256 color support
if [ -e /lib/terminfo/x/xterm-256color ]; then
#debian在/lib/terminfo/x/xterm-256color
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

#let gitkraken open the current git work dir of the terminal
alias kraken='gitkraken -p $(git rev-parse --show-toplevel) '

#converge CFD
#1.mpich
#
#alias srcCon='export PATH=/home/zt/Documents/software/mpich/bin:$PATH;export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/zt/Documents/software/mpich/lib'
#CONVERGE_ROOT='/opt/converge_2.3'
#CONVERGE_LICENSE='/opt/converge_2.3/license/license.lic'
#export PATH=/opt/converge_2.3.0/converge-2.3.19/l_x86_64/bin/:$PATH
#alias converge='mpirun /opt/converge_2.3.0/converge-2.3.19/l_x86_64/bin/converge-2.3.19-mpich2'
#export RLM_LICENSE=5053@127.0.0.1
#export LD_LIBRARY_PATH="/opt/CONVERGE_Studio/v2.3/lib64:$LD_LIBRARAY_PATH"
export LD_LIBRARY_PATH="/opt/CONVERGE_Studio/v2.3/lib64${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

alias converge='/opt/CONVERGE_Studio/v2.3/bin/CONVERGE_Studio_bin'
#add ifort and icc
#add  ifort & icc
#source /home/zt/software/intel/compilers_and_libraries_2018.0.128/linux/bin/ifortvars.sh intel64
#source /home/zt/software/intel/compilers_and_libraries_2018.0.128/linux/bin/iccvars.sh intel64
#end ifort & icc
#

#pointwise
alias pointwise="/home/zt/software/Pointwise/PointwiseV18.1R1/pointwise"

#chemkin
alias srcChemkin='~/software/reaction/chemkin15151_linuxx8664/bin/chemkinpro_setup.ksh && export PATH=~/software/reaction/chemkin15151_linuxx8664/bin/:$PATH'

#cantera
alias srcCantera='source pathtowkdir/SVNCANTERA211/INSTALL_DIR/bin/setup_cantera'

alias gambit='~/software/Fluent.Inc/bin/gambit'

alias of231='source $HOME/OpenFOAM/OpenFOAM-2.3.1/etc/bashrc WM_NCOMPPROCS=4 WM_MPLIB=SYSTEMOPENMPI; export WM_CC=gcc-5; export WM_CXX=g++-5'


alias of5='export PATH=/usr/bin/:$PATH; source /opt/openfoam5/etc/bashrc '


# python path for some python module installation
export PYTHONPATH=$PYTHONPATH:/home/zt/software/python-lib/lib/python3.6/site-packages

# star-ccm+
CDLMD_LICENSE_FILE='/home/zt/software/CD-adapco/13.06.012-R8/license.dat'
alias star='/home/zt/software/CD-adapco/13.06.012-R8/STAR-CCM+13.06.012-R8/star/bin/starccm+'
