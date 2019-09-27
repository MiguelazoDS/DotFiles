#Wine32 
export WINEPREFIX=~/.wine32 winetricks winecfg winefile wine

export TERM="screen-256color" 

#To make youtube-dl function to work.
unsetopt nomatch

#Fixed % symbol after print
export PROMPT_EOL_MARK=""

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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
#===========================================================================================================================================================================
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
#=================================================================================================================================================================================

#ALIASES
#=================================================================================================================================================================================
alias ls=lsd
alias cp="cp -v"
alias mv="mv -v"
alias copy=cpv
alias move="copy --remove-source-files"
alias rm="rm -v"
alias rename='perl-rename'
#alias dotfile='/usr/bin/git --git-dir=/home/miguel/.dotfiles/ --work-tree=/home/miguel'
alias dotfile='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=/home/miguel'
alias vim=nvim

function arch_update {
	if [ -z $1 ]
	then 
		yay -Syyu --devel --noconfirm; xmonad --recompile && xmonad --restart
	elif [ $1 = "-i" ]
	then 
		if [ -z $2 ]
		then
			echo "You must type a pkg name"
		else
			result=$(($#-1))
			if [ $result -gt 1 ]
			then
				word="packages are"
			else
				word="package is"
			fi 
			echo
			echo "|${@:2} $word not gonna be updated|"
			echo 
			yay -Syyu --devel --ignore ${@:2} --noconfirm; xmonad --recompile && xmonad --restart
		fi
	else
		echo "Invalid option"
	fi
}

function dependencies {
	if [ -z $1 ]
	then
		echo "You must type the pkg name"
	else
		sudo pacman -Qi $1
	fi
}

function pkglist {
	sudo pacman -Qqe > /tmp/packages; nvim /tmp/packages
}

function arch_clean {
	yay -Sc --noconfirm
	sudo pacman -Rns $(pacman -Qtdq)
	paccache -d
}

function infolinux {
	masterpdfeditor5 ~/Dropbox/.Info\ Linux/main.pdf&
}

function fastest_mirrors {
	sudo reflector --verbose -l 30 -f 10 --save /etc/pacman.d/mirrorlist
}

function clean_ram {
	sudo sync; sudo sh -c 'echo "3" > /proc/sys/vm/drop_caches'
	sudo swapoff -a; sudo swapon -a
}

function youtube-dl-mp3 {
	cmd="youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 -o %(title)s.%(ext)s"
	if [ $# = 1 ]
	then
		$cmd "$1"
	elif [ $# = 2 ]
	then
		$cmd "$1" "$2"
	else
		echo "Error"
	fi
}

function youtube-dl-v {
	cmd="youtube-dl -o \"%(title)s.%(ext)s\""
	echo hola $#
	if [ $# = 1 ]
	then
		eval $cmd $1
	elif [ $# = 2 ]
	then
		$cmd "$1" "$2"
	else
		echo "Error"
	fi
}

function reset_tmux {
	tmux kill-session -a
	tmux rename-session -t $(tmux display-message -p '#S' ) 0
}

function recent {
	rm ~/.local/share/recently-used.xbel
}

function linters {
	lints=("shellcheck" "sh" "gcc" "clang" "cppcheck" "ghc" "hlint" "stylish-haskell" "checkstyle" "google-java-format" "perl-critic" "flake8" "yapf" "vint")

	for linter in ${lints[*]}
	do
		output=$(yay -Qi $linter 2>&1)
		if [[ $output =~ "was not found" ]]
		then
			yay -S $linter	
		else
			echo "$linter already installed"
		fi
	done
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
