# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="af-magic"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
        git 
        zsh-autosuggestions
        colored-man-pages 
        extract 
        xcode 
        tmux
        you-should-use
        )

source $ZSH/oh-my-zsh.sh

# User configuration


alias vim="lvim"
alias im="lvim"
alias c="clear"
alias x="exit"
alias rz="source ~/.zshrc"
alias rt="tmux source ~/.tmux.conf"
alias Hc="history -c"
alias Hg="history | grep"
alias Ag="alias | grep"
alias ffs="sudo !!"

alias gco="git co"
alias gcm="git commit"
alias gst="git status -s"
alias kobreh="git reset --hard"
alias gg="git graph"
alias gd="ydiff"
alias glr="gl --recurse-submodules=yes"
alias gmo="git merge origin "





..() {
    if [ -z "$1" ]; then
        cd ..
    else
        cd `awk "BEGIN {while (c++<$1) printf \"../\"}"`
    fi
}

mcd ()
{
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}

gmr ()
{
    if [[ $# -eq 0 || $1 == "-h" || $1 == "--help" ]]; 
    then
        echo "Usage: $0 [-h] --title TITLE [--target BRANCH] [-d] [-r] [-a USER]"
        echo
        echo "Gitlab PR creation"
        echo
        echo "optional arguments:"
        echo -e "-d, --draft \t mark the PR as a draft."
        echo -e "-r, --remove \t remove the source branch on merge."
        echo -e "--target TARGET \t TARGET: branch to merge into. Default is master."
        echo -e "-a, --assign \t USER: User to assign the PR."
        echo 
        echo "required arguments:"
        echo -e "--title TITLE \t TITLE: title of PR."
        return 1
    fi

    TITLE=""
    TARGET="master"
    REMOVE_SOURCE=""
    DRAFT=""
    ASSIGNS=""
    while [[ $# -gt 0 ]]; do
        case "$1" in
        "-t"|"--title")
            shift 
            TITLE=$1
            shift
        ;;
        "-r"|"--remove")
            shift 
            REMOVE="-o merge_request.remove_source_branch"
            ;;
        "-d"|"--draft")
            shift
            DRAFT="-o merge_request.draft"
            ;;
        "--target")
            shift
            TARGET=$1
            shift
            ;;
        "-a"|"--assign")
            shift
            ASSIGNS+= "-o merge_request.assign=$1"
            shift
            ;;
        *)
            gmr -h
            return 1
            ;;
        esac
    done
    if [[ "$TITLE" == "" ]];
    then 
        echo "Missing required argument --title. Please look at gmr -h"
        return 1
    fi

    gpsup -o merge_request.create -o "merge_request.title=$TITLE" -o merge_request.target=$TARGET $DRAFT $REMOVE $ASSIGNS 
    
}
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
