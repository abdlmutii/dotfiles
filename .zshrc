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
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE="nerdfont-complete"

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
ENABLE_CORRECTION="true"

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
plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-completions)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# F a full list of active aliases, run `alias`.

# Run command:
run() {
    latest_file=$(ls -lt --time=atime --time-style=+"%Y-%m-%d %H:%M:%S" | head -n 2 | tail -n 1 | awk '{print $8}')
    file_extension="${latest_file##*.}"
    file_directory=$(dirname "$latest_file")

    if [[ $file_extension == "go" ]]; then
        go run $file_directory
    elif [[ $file_extension == "js" || $file_extension == "ts" ]]; then
        node $file_directory
    elif [[ $file_extension == "py" ]]; then
        python $file_directory
    elif [[ $file_extension == "sh" ]]; then
        $file_directory
    else
        echo "Unsupported file extension."
    fi
}

mkd() {
    mkdir $1 && cd $1
}

se1f() {
    for file in "$@"; do
        if [ ! -s "$file" ] || [ ! -e "$file" ]; then
            echo "Empty or deleted file: $file"
        else
            extension="${file##*.}"
            content=$(cat "$file")

            content_escaped=$(jq -Rs '.' <<< "$content")

            payload=$(jq -n --arg name "$file" --arg code "$content_escaped" --arg lang "$extension" \
                '{"name": $name, "code": $code, "lang": $lang}')

            response=$(curl -s -X POST -H "Content-Type: application/json" -d "$payload" \
                "https://your_se1f_selfhosted.serveo.net/create")

            echo "$response"
        fi
    done
}

n() {
    if [ ! -s "$1" ] || [ ! -e "$1" ]; then
        touch "$1" && nvim "$1"
    else
        case "$1" in
            *.png|*.jpg|*.jpeg|*.gif|*.bimp)
                ./imgcat $1
                ;;
            *)
                nvim "$1"
                ;;
        esac
    fi
}

cpy() {
cat $1 | termux-clipboard-set
}


# aliases

# Development
alias gor="go run ."
alias nor="node ."

# File management
alias ls="eza -s extension --icons"
alias mkd="mkdir"
alias rmdir="rm -rf"

# Configuration files
alias zshrc="nvim ~/.zshrc"
alias omzrc="nvim ~/.oh-my-zsh"
alias neorc="nvim ~/.config/neofetch/config.conf"
alias chadrc="nvim ~/.config/nvim/lua/custom/chadrc.lua"
alias yzrc="nvim ~/.config/yazi/yazi.toml"

# Neovim
alias plugins="nvim ~/.config/nvim/lua/custom/plugins.lua"
alias autocmd="nvim ~/.config/nvim/lua/custom/autocmd.lua"
alias mappings="nvim ~/.config/nvim/lua/custom/mappings.lua"
alias hh="nvim ~/.config/nvim/lua/custom/highlights.lua"
alias opts="nvim ~/.config/nvim/lua/custom/opts.lua"
alias init="nvim ~/.config/nvim/lua/custom/init.lua"
alias chad="cd ~/.config/nvim/lua/custom"

# Terminal utilities
alias termux="cd ~/.termux && ls"
alias flash="termux-torch"
alias reload="termux-reload-settings"

# Obsidian
alias obsidian="cd storage/shared/vaults/*"
alias obsidian-sync="obsidian && rclone copy . obsidian:Vault"

# Miscellaneous
alias upload="termux-storage-get"
alias p9k="p10k configure"

# Yazi configuration
alias yzconf="cd ~/.config/yazi/"
alias yztheme="cd ~/.config/yazi/flavors/catppuccin-mocha.yazi/"

# Start neofetch on startup
neofetch

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
