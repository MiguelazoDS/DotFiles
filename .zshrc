fif() {
    if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
    local file
    file="$(rga --max-count=1 --ignore-case --files-with-matches --no-messages "$@" | fzf-tmux +m --preview="rga --ignore-case --pretty --context 10 '"$@"' {}")" && open "$file"
}


#Wine32
export WINEPREFIX=~/.wine32 winetricks winecfg winefile wine

export TERM="screen-256color"

#Using ccache
export CCACHE_DIR="$HOME/.ccache"
export CXX="ccache g++"
export CC="ccache gcc"
export PATH="/usr/lib/ccache/bin/:$PATH"

#Fixed % symbol after print
export PROMPT_EOL_MARK=""

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Cuda
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

#Disable warnings
ZSH_DISABLE_COMPFIX=true

#Disable autosetting terminal title.
DISABLE_AUTO_TITLE=true

#POWERLEVEL10K CONFIGURATION
#======================================================================================================================================================================
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
#======================================================================================================================================================================

#ALIASES
#======================================================================================================================================================================
alias ls=lsd
alias cp="cp -v"
alias mv="mv -v"
alias copy=cpv
alias move="copy --remove-source-files"
alias rm="rm -v"
alias rename='perl-rename'
alias dotfile='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=/home/miguel'
alias vim=nvim
alias nvidia-smi='watch -n 1 nvidia-smi'

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
	else
		echo "Argument needed: Either \"pull\" or \"cp\""
	fi
}
#=====================================================================================================================================================================

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

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
