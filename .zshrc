#zplug path
source /usr/share/zsh/scripts/zplug/init.zsh

#Plugins
zplug 'wfxr/forgit'

#Use the vi navigation keys in menu completion
zstyle ':completion:*' menu select
zmodload zsh/complist
bindkey -M menuselect 'j' vi-backward-char
bindkey -M menuselect 'i' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'k' vi-down-line-or-history

#fzf default command to see hidden files
export FZF_DEFAULT_COMMAND='find . -printf "%P\\n"'

#Wine32
export WINEPREFIX=~/.wine32 winetricks winecfg winefile wine

#Set colors
export TERM="screen-256color"

#Using ccache
export CCACHE_DIR="$HOME/.ccache"
export CXX="ccache g++"
export CC="ccache gcc"
export PATH="/usr/lib/ccache/bin/:$PATH"

#Fixed % symbol after print
export PROMPT_EOL_MARK=""

#If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$PATH

#Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#Cuda
export LD_LIBRARY_PATH=/opt/cuda-10.0/extras/CUPTI/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/opt/cuda-10.0/lib64:$LD_LIBRARY_PATH

#Open new terminal same directory
function cd {
	builtin cd $@
	pwd > ~/.last_dir
}
if [ -f ~/.last_dir ]; then
	cd "$(cat ~/.last_dir)"
fi

#Find inside files
function fif {
	if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
	local file
	file="$(rga --hidden --max-count=1 --ignore-case --files-with-matches --no-messages "$@" | fzf-tmux +m --preview="rga --ignore-case --pretty --context 10 '"$@"' {}")" && xdg-open "$file"
}

#Create folder before unzip
function uz {
	name=$(echo "$1" | cut -d '.' -f 1)
	mkdir "$name"
	unzip "$1" -d "$name"
}

#Disable warnings
ZSH_DISABLE_COMPFIX=true

#Disable autosetting terminal title.
DISABLE_AUTO_TITLE=true

#POWERLEVEL10K CONFIGURATION
#===========================================================================================
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_icon custom_root custom_name dir vcs custom_arrow)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(custom_branch background_jobs)
POWERLEVEL9K_CUSTOM_ICON="icon"
POWERLEVEL9K_CUSTOM_ROOT="root"
POWERLEVEL9K_CUSTOM_NAME="name"
POWERLEVEL9K_CUSTOM_ARROW="arrow"
POWERLEVEL9K_CUSTOM_BRANCH="branch"
POWERLEVEL9K_CUSTOM_ICON_BACKGROUND="255" #grey93
POWERLEVEL9K_CUSTOM_ICON_FOREGROUND="024" #deepskyblue4a
POWERLEVEL9K_CUSTOM_ROOT_BACKGROUND="016" #grey0
POWERLEVEL9K_CUSTOM_ROOT_FOREGROUND="136" #darkgoldenrod
if [ $USER = "root" ]
then
	POWERLEVEL9K_CUSTOM_NAME_BACKGROUND="124" #red3
else
	POWERLEVEL9K_CUSTOM_NAME_BACKGROUND="064" #chartreuse4
fi
POWERLEVEL9K_CUSTOM_NAME_FOREGROUND="255" #grey93
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="024" #deepskyblue4a
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="255" #grey93
POWERLEVEL9K_DIR_HOME_BACKGROUND="024" #deepskyblue4a
POWERLEVEL9K_DIR_HOME_FOREGROUND="255" #grey93
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="024" #deepskyblue4
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="255" #grey93
POWERLEVEL9K_CUSTOM_ARROW_BACKGROUND="255" #grey93
POWERLEVEL9K_CUSTOM_ARROW_FOREGROUND="024" #deepskyblue4a
POWERLEVEL9K_CUSTOM_BRANCH_BACKGROUND="064" #chartreuse4
POWERLEVEL9K_CUSTOM_BRANCH_FOREGROUND="255" #grey93
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='237' #grey23
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='064' #chartreuse4
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='237' #grey23
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='064' #chartreuse4
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='237' #grey23
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='136' #darkgoldenrod
icon(){
	echo "\uf303"
}
root(){
	if [ $USER = "root" ]
	then
		echo "\ue315"
	fi
}
name(){
	echo "$USER"
}
arrow(){
	echo "\uf0a9"
}
branch(){
	if [ ! $USER = "root" ]
	then
		all=$(dotfile status)
		branch=$(echo $all | head -1 | cut -d ' ' -f3)
		stage="Changes not staged"
		commit="Changes to be"
		push="Your branch is ahead"
		pull="Your branch is behind"
		printf $branch
		if [[ $all =~ $stage ]]
		then
			printf " \uf06a"
		fi
		if [[ $all =~ $commit ]]
		then
			printf " \uf055"
		fi
		if [[ $all =~ $push ]]
		then
			printf " \uf0aa"
		fi
		if [[ $all =~ $pull ]]
		then
			printf " \uf0ab"
		fi
	fi
}

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	fast-syntax-highlighting
	cp
	rake-fast
)

source $ZSH/oh-my-zsh.sh
#==========================================================================================

#ALIASES
#==========================================================================================
alias ls=lsd
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="echo rm command is discourage, use trm instead. If you still want to run it, use backslash to escape it"
alias rename='perl-rename'
alias vim=nvim
alias nvidia-smi='watch -n 1 nvidia-smi'
alias unzip='echo "Use uz instead"'
alias youtube-dl-mp3="noglob youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 -o %(title)s.%(ext)s"

function dotf (){
	branch=$(echo "$(dotfile status)" | head -1 | cut -d ' ' -f3)
	if [[ $1 =~ "push" ]]; then
		dotfile push
		if [[ $branch =~ "desktop" ]]; then
			dotfile checkout notebook
			dotfile push
			dotfile checkout desktop
		else
			dotfile checkout desktop
			dotfile push
			dotfile checkout notebook
		fi
	elif [[ $1 =~ "pull" ]]; then
		dotfile pull
		if [[ $branch =~ "desktop" ]]; then
			dotfile checkout notebook
			dotfile pull
			dotfile checkout desktop
		else
			dotfile checkout desktop
			dotfile pull
			dotfile checkout notebook
		fi
	elif [[ $1 =~ "cp" ]]; then
		commit=$(echo "$(dotfile log -1)" | head -1 | cut -d ' ' -f2)
		if [[ $branch =~ "desktop" ]]; then
			dotfile checkout notebook
			dotfile cherry-pick "$commit"
			dotfile checkout desktop
		else
			dotfile checkout desktop
			dotfile cherry-pick "$commit"
			dotfile checkout notebook
		fi
	elif [[ $1 =~ "add" ]]; then
		ls -A | fzf-tmux --bind 'ctrl-l:deselect-all' -r -m --print0 | xargs -r -0 dotfile add
	elif [[ $1 =~ "chkt" ]]; then
		dotfile ls-files -m | fzf-tmux --bind 'ctrl-l:deselect-all' -r -m --print0 | xargs -r -0 dotfile checkout
	elif [[ $1 =~ "st" ]]; then
		dotfile status
	elif [[ $1 =~ "diff" ]]; then
		dotfile diff
	elif [[ $1 =~ "ct" ]]; then
		dotfile commit -m $2
	elif [[ $1 =~ "ch" ]]; then
		if [[ $branch =~ "desktop" ]]; then
			dotfile checkout notebook
		else
			dotfile checkout desktop
		fi
	elif [[ $1 =~ "log" ]]; then
		dotfile log
	else
		echo "Argument needed: Either \"push\", \"pull\", \"cp\", \"add\", \"chkt\", \"st\", \"ct\", \"ch\" or \"log\""
	fi
}
#========================================================================================================

PATH="/home/miguel/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/miguel/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/miguel/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/miguel/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/miguel/perl5"; export PERL_MM_OPT;

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
	eval "$__conda_setup"
else
	if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
		. "/opt/anaconda/etc/profile.d/conda.sh"
	else
		export PATH="/opt/anaconda/bin:$PATH"
	fi
fi
unset __conda_setup
# <<< conda initialize <<<

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
