
# Verify if oh-my-zsh and powerlevel10k is installed
[[ ! -d $HOME/.oh-my-zsh ]] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
if [[ -d $HOME/.oh-my-zsh ]] && [[ ! -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Verify fzf is installed
[[ ! -d $HOME/.fzf ]] && (git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf; ~/.fzf/install)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#zplug path
source /usr/share/zsh/scripts/zplug/init.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

export TERMINFO="/usr/share/terminfo"

hash xclip
[[ $? -eq 1 ]] && (printf "\nxclip is not installed\nInstalling..."; yay -S xclip --noconfirm)

#Verify if nvim is installed
hash nvim 2> /dev/null
[[ $? -eq 0 ]] && export EDITOR=nvim

#Plugins
command -v zplug >/dev/null
[[ $? -eq 1 ]] && (printf "\nzplug is not installed\nInstalling"; yay -S zplug --noconfirm)
zplug "wfxr/forgit"

#Use the vi navigation keys in menu completion
zstyle ':completion:*' menu select
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

#fzf default command to see hidden files
export FZF_DEFAULT_COMMAND='find . -printf "%P\\n"'

#Wine32
export WINEPREFIX=~/.wine32 winetricks winecfg winefile wine

#Set colors
export TERM="screen-256color"

#Fixed % symbol after print
export PROMPT_EOL_MARK=""

#If you come from bash you might have to change your $PATH.
ghcupPath="$HOME/.ghcup/bin"
export PATH=$ghcupPath:$HOME/.local/bin:$PATH

hash pip 2> /dev/null
[[ $? -eq 1 ]] && (printf "\npip is not installed\nInstalling..."; yay -S python-pip --noconfirm)

hash imosum 2>/dev/null
[[ $? -eq 1 ]] && (printf "\nimosum is not installed\nInstalling..."; pip install imohash)

hash convert
[[ $? -eq 1 ]] && (printf "\nimagemagick is not installed\nInstalling..."; yay -S imagemagick --noconfirm)

hash exa
[[ $? -eq 1 ]] && (printf "\nexa is not installed\nInstalling..."; yay -S exa --noconfirm)

hash rg
[[ $? -eq 1 ]] && (printf "\nripgrep is not installed\nInstalling..."; yay -S ripgrep --noconfirm)

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
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_name dir vcs custom_arrow)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(custom_branch background_jobs)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_CUSTOM_NAME="name"
POWERLEVEL9K_CUSTOM_ARROW="arrow"
POWERLEVEL9K_CUSTOM_BRANCH="branch"
if [ $USER = "root" ]
then
    POWERLEVEL9K_CUSTOM_NAME_BACKGROUND="black" #red
    POWERLEVEL9K_CUSTOM_NAME_FOREGROUND="red" #darkgoldenrod
else
    POWERLEVEL9K_CUSTOM_NAME_BACKGROUND="255" #grey93
    POWERLEVEL9K_CUSTOM_NAME_FOREGROUND="024" #deepskyblue4a
fi
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="024" #deepskyblue4a
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="255" #grey93
POWERLEVEL9K_DIR_HOME_BACKGROUND="024" #deepskyblue4a
POWERLEVEL9K_DIR_HOME_FOREGROUND="255" #grey93
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="024" #deepskyblue4a
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="255" #grey93
POWERLEVEL9K_CUSTOM_ARROW_BACKGROUND="252" #grey82
POWERLEVEL9K_CUSTOM_ARROW_FOREGROUND="024" #deepskyblue4a
POWERLEVEL9K_CUSTOM_BRANCH_BACKGROUND="094" #orange4a
POWERLEVEL9K_CUSTOM_BRANCH_FOREGROUND="255" #grey93
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='236' #grey19
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='064' #chartreuse4
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='236' #grey19
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='064' #chartreuse4
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='236' #grey19
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='094' #orange4a
name(){
    if [ $USER = "root" ]
    then
        echo "\uf21b"
    else
        echo "\uf007"
    fi
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
        if [[ $all =~ $stage ]]
        then
            printf "\uf06a"
        elif [[ $all =~ $commit ]]
        then
            printf "\uf055"
        elif [[ $all =~ $push ]]
        then
            printf "\uf0aa"
        elif [[ $all =~ $pull ]]
        then
            printf "\uf0ab"
        else
            printf "\uf113"
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
    zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh
if [[ ! -d $ZSH_CUSTOM/plugins/fast-syntax-highlighting ]]; then
    git clone https://github.com/zdharma/fast-syntax-highlighting.git ~ZSH_CUSTOM/plugins/fast-syntax-highlighting
fi
if [[ ! -d $ZSH_CUSTOM/plugins/zsh-autosuggestions ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

#==========================================================================================

#Load zplug
zplug load

#ALIASES
#==========================================================================================
alias ls='exa --icons'
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="echo rm command is discourage, use trm instead. If you still want to run it, use backslash to escape it"
alias rename='perl-rename'
alias unzip='echo "Use uz instead"'
alias youtube-dl-mp3="noglob youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 -o %(title)s.%(ext)s"
alias youtube-dl="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'"

function dotf (){
    branch=$(echo "$(dotfile status)" | head -1 | cut -d ' ' -f3)
    if [[ $1 =~ "push" ]]; then
        dotfile push
    elif [[ $1 =~ "pull" ]]; then
        dotfile pull
    elif [[ $1 =~ "add" ]]; then
        find $HOME $HOME/.config -maxdepth 3 | sort | uniq | fzf-tmux --bind 'ctrl-l:deselect-all' -r -m --print0 | xargs -r -0 dotfile add
    elif [[ $1 =~ "chkt" ]]; then
        dotfile ls-files $HOME -m | fzf-tmux --bind 'ctrl-l:deselect-all' -r -m --print0 | xargs -r -0 dotfile checkout
    elif [[ $1 =~ "st" ]]; then
        dotfile status
    elif [[ $1 =~ "diff" ]]; then
        dotfile diff
    elif [[ $1 =~ "ct" ]]; then
        dotfile commit -m $2
    elif [[ $1 =~ "log" ]]; then
        dotfile log
    else
        echo "Argument needed: Either \"push\", \"pull\", \"add\", \"chkt\", \"st\", \"diff\", \"ct\", or \"log\""
    fi
}
#========================================================================================================

PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ 1 -eq 0 ]; then
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

#Anaconda workaround curl
hash conda 2> /dev/null
[[ $? -eq 0 ]] && export PATH=/usr/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
