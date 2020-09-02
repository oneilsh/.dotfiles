# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME="lambda"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git 
  history-substring-search
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## Load version control information
#autoload -Uz vcs_info
#precmd() { vcs_info }
#zstyle ':vcs_info:*' check-for-changes true
#
#autoload -U colors && colors
#local returncode="%(?..%{$fg[red]%} %? ↵ %{$reset_color%}) " 
#
## Format the vcs_info_msg_0_ variable
#zstyle ':vcs_info:git:*' formats '%{%F{green}%}[%b %u]{%f%} '
#
## Set up the prompt (with git branch name)
#setopt PROMPT_SUBST
#PROMPT='${returncode}%~ > '

POWERLEVEL9K_SHORTEN_DELIMITER='*'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_from_right

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

POWERLEVEL9K_DIR_HOME_BACKGROUND='grey15'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='grey15'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='grey15'
POWERLEVEL9K_DIR_HOME_FOREGROUND='grey69'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='grey69'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='grey69'

POWERLEVEL9K_DIR_PATH_HIGHLIGHT_BOLD=false
#POWERLEVEL9K_BATTERY_LEVEL_BACKGROUND=(darkred orange4 yellow4 yellow4 chartreuse3 green3 green4 darkgreen)
#POWERLEVEL9K_BATTERY_STAGES="        "
##POWERLEVEL9K_BATTERY_STAGES="▁▂▃▄▅▆▇█"
#POWERLEVEL9K_BATTERY_VERBOSE=false
export PATH=$HOME/local/bin/:$PATH
export PATH=$HOME/.krew/bin:$PATH
export PATH=$HOME/Library/Python/3.8/bin:$PATH

alias avery="ssh -p 732 oneils@avery.actf.oregonstate.edu"
alias actf="ssh -p 732 oneilst@shell.actf.oregonstate.edu"
alias cgrb="ssh -p 732 oneils@shell.cgrb.oregonstate.edu"


eval "$(direnv hook zsh 2> /dev/null)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

export PATH=$HOME/local/bin/utils/k8s:$PATH
export PATH=$HOME/local/bin/utils/osxutils:$PATH
export PATH=$HOME/local/bin/utils/rscripts:$PATH

alias k=kubectl
complete -F __start_kubectl k
source ~/.powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias tmux="tmux -u"   # get tmux to play nice with powerline fonts over ssh https://github.com/wernight/powerline-web-fonts/issues/8#issuecomment-353081869

# for kubectl krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
