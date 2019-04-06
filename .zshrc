export WINEPREFIX=~/.wine32 winetricks winecfg winefile wine
alias dotfile='/usr/bin/git --git-dir=/home/miguel/.dotfiles/ --work-tree=/home/miguel'
export TERM="screen-256color" 
export PROMPT_EOL_MARK=""
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/miguel/.oh-my-zsh"
#scan Haskell
export PATH=~/.local/bin:$PATH
function cd {
        builtin cd $@
        pwd > ~/.last_dir
}
if [ -f ~/.last_dir ]; then
        cd "`cat ~/.last_dir`"
fi

ZSH_DISABLE_COMPFIX=true
DISABLE_AUTO_TITLE=true

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="powerlevel9k/powerlevel9k"
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
	POWERLEVEL9K_CUSTOM_NAME_BACKGROUND="red" #chartreuse4
else
	POWERLEVEL9K_CUSTOM_NAME_BACKGROUND="064" #chartreuse4
fi
POWERLEVEL9K_CUSTOM_NAME_FOREGROUND="255" #grey93
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="023" #deepskyblue4
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="255" #grey93
POWERLEVEL9K_DIR_HOME_BACKGROUND="023" #deepskyblue4
POWERLEVEL9K_DIR_HOME_FOREGROUND="255" #grey93
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="023" #deepskyblue4
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="255" #grey93
POWERLEVEL9K_CUSTOM_ARROW_BACKGROUND="255" #grey93
POWERLEVEL9K_CUSTOM_ARROW_FOREGROUND="023" #grey93
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
		echo `dotfile status | head -1 | cut -d ' ' -f3`
	fi
}
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
  fast-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

PATH="/home/miguel/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/miguel/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/miguel/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/miguel/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/miguel/perl5"; export PERL_MM_OPT;

