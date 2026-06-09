# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# # load time test
# zmodload zsh/zprof

export HISTFILE=~/.zsh_history
export HISTSIZE=20000
export SAVEHIST=20000


# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="random"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
ZSH_THEME_RANDOM_CANDIDATES=( "walkerk1980-fruit" "walkerk1980-sushi" "walkerk1980-ramen" )

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
  zsh-syntax-highlighting
  zsh-autosuggestions
  # jfrog
)

source $ZSH/oh-my-zsh.sh

# User configuration

### ZSH KEYBINDINGS

# autosuggest-accept: Accepts the current suggestion.
# autosuggest-execute: Accepts and executes the current suggestion.
# autosuggest-clear: Clears the current suggestion.
# autosuggest-fetch: Fetches a suggestion (works even when suggestions are disabled).
# autosuggest-disable: Disables suggestions.
# autosuggest-enable: Re-enables suggestions.
# autosuggest-toggle: Toggles between enabled/disabled suggestions.

# bindkey '^[[27;2;13~' autosuggest-accept

### END ZSH KEYBINDINGS

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"




############## pre-ohmyzsh ############


### PATH

# add home .local/bin to path
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# add Homebrew/Linuxbrew to the PATH
if [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv zsh)"
fi

# add Poetry to the PATH
if [ -f $HOME/.poetry/bin/poetry ]; then
  export PATH="$HOME/.poetry/bin:$PATH"
  export PATH="/usr/local/opt/python/bin:$PATH"
  export PATH="/usr/local/sbin:$PATH"
fi

# Add user python3.x site-packages to the PATH
py3version=$(/usr/bin/env python3 --version 2>&1 | awk '{print $2}' | awk -F. '{print $1"."$2}')
if [ -d $HOME/.local/lib/python$py3version/site-packages ]; then
  export PATH="$PATH:$HOME/.local/lib/python$py3version/site-packages"
fi

# add Pulumi to the PATH
if [ -d "$HOME/.pulumi/bin" ]; then
  export PATH="$PATH:$HOME/.pulumi/bin"
fi

### END PATH

## AUTOCOMPLETE
autoload -Uz compinit && compinit

# Bash Aliases
autoload bashcompinit && bashcompinit

#########################################
## User specific aliases and functions ##
#########################################

# User specific aliases and functions
if [ -d /usr/local/share/zsh-completions ]; then
    for rc in /usr/local/share/zsh-completions/*; do
        if [ -f "$rc" ]; then
            # echo source "$rc"
            source "$rc"
        fi
    done
fi

fpath=(~/.zsh/completion $fpath)

unset rc
if [ -d ~/.zshrc.d ]; then
    for rc in ~/.zshrc.d/.*; do
        if [ -f "$rc" ]; then
            source "$rc"
        fi
    done
fi
unset rc

# Aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi
if [ -f ~/.local_aliases ]; then
  source ~/.local_aliases
fi

# terramate
if [ -f /usr/bin/terramate ]; then
  complete -o nospace -C /usr/bin/terramate terramate
fi

# terraform
if [ -f /usr/bin/terraform ]; then
  complete -C /usr/bin/terraform terraform
fi

# tofu
if [ -f /usr/bin/tofu ]; then
  complete -C /usr/bin/tofu tofu
fi

# Gcloud cli
if [ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc ]; then
  source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
elif [ -f /etc/bash_completion.d/gcloud ]; then
  source /etc/bash_completion.d/gcloud
fi
if [ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc ]; then
  source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
fi

# AWS cli
aws_completer_path=$(which aws_completer 2>/dev/null)
if [ -f "$aws_completer_path" ]; then
  complete -C "$aws_completer_path" aws
fi

# Az cli
if [ -f /usr/local/etc/bash_completion.d/az ]; then
  source /usr/local/etc/bash_completion.d/az
elif [ -f /etc/bash_completion.d/azure-cli ]; then
  source /etc/bash_completion.d/azure-cli
elif [ -f ~/.local/share/bash-completion/completions/azure-cli ]; then
  source ~/.local/share/bash-completion/completions/azure-cli
fi

# source pulumi zsh completions
if [ -f /usr/local/share/zsh-completions/pulumi ]; then
  source /usr/local/share/zsh-completions/pulumi
fi

# jfrog cli
if [ -f ~/.jfrog/jfrog_zsh_completion ]; then
  source ~/.jfrog/jfrog_zsh_completion
fi

# complete aliases
setopt nocompletealiases

### END AUTOCOMPLETE

### ZSH OPTIONS

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
# setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
# setopt SHARE_HISTORY             # Share history between all sessions.
# setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
# setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
# setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
# setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
unsetopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# Do you wish to see all $LISTMAX possibilities
LISTMAX=400

# override PAGER settings from ~/.oh-my-zsh/lib/misc.zsh
# add -F so that less exists automatically with one-page output
# define pager depending on what is available (less or more)
if (( ${+commands[less]} )); then
  export PAGER='less'
  export LESS='-F -R'
elif (( ${+commands[more]} )); then
  export PAGER='more'
fi


### END ZSH OPTIONS

# Starship prompt
# eval "$(starship init zsh)"

# welcome screen
#fastfetch --stat|| neofetch

export BROWSER='firefox'


# # end load time test
# zprof

