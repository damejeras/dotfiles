# ===================================================
# =========== Setup fzf and key bindings ============
# ===================================================
# Ensure fzf binary is downloaded
if [[ -d "$HOME/.fzf" ]]; then
  if [[ ! -f "$HOME/.fzf/bin/fzf" ]]; then
    echo "Installing fzf..."
    $HOME/.fzf/install --bin
  fi
fi
# Ensure its in the path
if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}${HOME}/.fzf/bin"
fi
# Enable completion and key-bindings
source "$HOME/.fzf/shell/completion.zsh"
source "$HOME/.fzf/shell/key-bindings.zsh"

# ====================================================
# ================== Setup paths =====================
# ====================================================

# Add Go binaries to path
if [[ -d "$HOME/go/bin" ]]; then
  if [[ ! "$PATH" == *$HOME/go/bin* ]]; then
    export PATH="${PATH:+${PATH}:}${HOME}/go/bin"
  fi
fi

# Add local binaries
export PATH=$HOME/.local/bin:$PATH

# ========================================================
# =============== Custom shell config ====================
# ========================================================

# Launch devbox shell
eval "$(devbox global shellenv)"

# Initialize zoxide
eval "$(zoxide init zsh)"

# Enable direnv
eval "$(direnv hook zsh)"

# Dont polute $HOME
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# ========================================================
# =============== History configuration ==================
# ========================================================

HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

# Immediately append to history:
setopt inc_append_history

# Record timestamp in history:
setopt extended_history

# Expire duplicate entries first when trimming history:
setopt hist_expire_dups_first

# Don't record duplicates:
setopt hist_ignore_dups

# Delete old recorded entry if new entry is a duplicate:
setopt hist_ignore_all_dups

# Do not display a line previously found:
setopt hist_find_no_dups

# Don't record an entry startin with a space:
setopt hist_ignore_space

#Share history between sessions:
setopt share_history

# Execite command immediately after history expansion:
unsetopt hist_verify


# ========================================================
# =============== Oh My Zsh Config =======================
# ========================================================

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom/

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions)

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

alias dc="docker-compose"
alias k="kubectl"
alias t="tmux-session" # quick tmux session creation
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME" # dotfiles alias

alias tmpf="export TEMP=\$(mktemp)"
alias tmpd="export TEMP=\$(mktemp -d)"

# ====================================================
# ========= Load machine specific config =============
# ====================================================

if [[ -f "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi

# ======================================================
# ========= Everything below probably is junk ==========
# ======================================================

