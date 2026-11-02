
#===================================================================================
# --- Terminal & Environment ---
#===================================================================================

DISABLE_AUTO_TITLE="true"

export MOZ_ENABLE_WAYLAND=1
export PATH="$HOME/.local/bin:$PATH"

export EDITOR="nvim"
export VISUAL="nvim"

export DOTNET_ROOT="/usr/share/dotnet"
export PATH="$PATH:$DOTNET_ROOT:$HOME/.dotnet/tools"


#===================================================================================
# --- Zsh Options & History ---
#===================================================================================

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS


#===================================================================================
# --- Completion Setup ---
#===================================================================================

fpath=(/usr/share/zsh/site-functions/ $fpath)

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

autoload -Uz compinit
compinit


#===================================================================================
# --- Startup Integrations ---
#===================================================================================

# Directory navigation
eval "$(zoxide init zsh)"

# Environment variables per directory
eval "$(direnv hook zsh)"


#===================================================================================
# --- Pywal Colors ---
#===================================================================================

if [[ -f "$HOME/.cache/wal/sequences" ]]; then
    command cat "$HOME/.cache/wal/sequences"
fi

if [[ -f "$HOME/.cache/wal/colors-tty.sh" ]]; then
    source "$HOME/.cache/wal/colors-tty.sh"
fi


#===================================================================================
# --- FZF Customization ---
#===================================================================================

export FZF_DEFAULT_OPTS="
    --height 60%
    --layout=reverse
    --border
    --color=spinner:#f38ba8,hl:#f38ba8
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f38ba8
    --color=marker:#f38ba8,prompt:#cba6f7,hl+:#f38ba8
    --bind 'ctrl-u:half-page-up'
    --bind 'ctrl-d:half-page-down'
"

# Default file search
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'

# Ctrl+T
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_CTRL_T_OPTS="
    --preview 'bat -n --color=always --line-range :500 {}'
    --bind 'ctrl-/:change-preview-window(down|hidden|)'
"

# Alt+C
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

export FZF_ALT_C_OPTS="
    --preview 'eza --tree --color=always --level=2 {} | head -200'
"

# Ctrl+R
export FZF_CTRL_R_OPTS="
    --preview 'echo {}'
    --preview-window down:3:wrap:hidden
    --bind 'ctrl-/:toggle-preview'
    --bind 'alt-y:execute-silent(echo -n {2..} | xclip -selection clipboard)+abort'
    --header 'Press CTRL-/ to toggle preview | ALT-Y to copy command'
"


#===================================================================================
# --- Ripgrep + FZF Integration ---
#===================================================================================

rgf() {
    local initial_query="${*:-}"

    local RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case"

    FZF_DEFAULT_COMMAND="$RG_PREFIX $(printf %q "$initial_query")" \
        fzf --ansi \
            --disabled \
            --query "$initial_query" \
            --bind "change:reload:$RG_PREFIX {q} || true" \
            --delimiter : \
            --preview 'bat --style=numbers --color=always --highlight-line {2} {1}' \
            --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
            --bind 'enter:execute(nvim +{2} {1})+abort'
}


#===================================================================================
# --- Git FZF Checkout ---
#===================================================================================

fzf-git-checkout() {
    local branch

    branch=$(git branch -a --color=always |
        grep -v '/HEAD\s' |
        sed 's/^..//' |
        fzf --ansi \
            --preview 'git log --graph --oneline --color=always --max-count=50 {1}' \
            --prompt="Checkout Branch > ")

    if [[ -n "$branch" ]]; then
        branch=$(echo "$branch" |
            tr -d '[:space:]' |
            sed 's#origin/##')

        git checkout "$branch"
    fi
}


#===================================================================================
# --- Custom Functions ---
#===================================================================================

mkcd() {
    mkdir -p "$1" && cd "$1"
}


#===================================================================================
# --- Aliases ---
#===================================================================================

# Core
alias cls="clear"
alias tmn="tmux new-session -s"
alias c="cargo"
alias cat="bat"
alias ff="fzf"
alias top="btop"
alias du="ncdu"
alias q="exit"

alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias fkill="ps -ef | sed 1d | fzf -m | awk '{print \$2}' | xargs kill -9"


# Eza
alias ls="eza --icons=auto --group-directories-first"
alias l="eza -lbF --git --icons=auto"
alias ll="eza -la --icons=auto --group-directories-first"
alias la="eza -a --icons=auto"
alias lt="eza --tree --level=2 --icons=auto"
alias lta="eza --tree --level=2 -a --icons=auto"
alias lsize="eza -la --sort=size --icons=auto"
alias ldate="eza -la --sort=date --icons=auto"


# Config & Workflow
alias vi="nvim"
alias y="yazi"
alias bee="cmus"
alias fs="fastfetch"
alias run="python3"

alias dot="cd ~/dotfiles"
alias conf="cd ~/.config"

alias reload="source ~/.zshrc"
alias hyprreload="hyprctl reload"

alias gcc-check="gcc -Wall -Wextra -pedantic -std=c11"


# Arch Linux
alias suup="sudo pacman -Syu"
alias del="sudo pacman -Rns"
alias ins="sudo pacman -S"
alias pls="sudo"

alias cleanup="sudo pacman -Rns \$(pacman -Qdtq)"

alias mirrors="sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"

alias yayup="yay -Syu"
alias yayin="yay -S"


# Git
alias g="git"
alias gg="lazygit"
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gcb="git checkout -b"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"

alias glog="git log --oneline --graph --decorate"


# Rofi / Pywal
alias wall="rofi-wallpaper"
alias sw="setwal"
alias ss="screenshot.sh"


#===================================================================================
# --- Command Not Found Roasts ---
#===================================================================================

command_not_found_handler() {
    local cmd="$1"

    local responses=(
        "'$cmd' you just made that up, didn't you?"
        "not gonna last long huh?"
        "'$cmd'? pure delusion"
        "skill issue of the highest order"
        "who the fuck taught you '$cmd'"
        "'$cmd' got rejected by reality"
        "that's not allowed here bro"
        "bold of you to type '$cmd'"
        "'$cmd' really bruhh?"
        "'$cmd' shittt!!, you are kidding right?"
        "fuck offfffff, bruhh!"
        "'$cmd' ain't a command"
        "absolute clown command"
        "nah '$cmd' ain't real"
        "that one's going in the hall of shame"
        "'$cmd' has zero survival chance"
        "you really thought '$cmd' would work huh?"
        "'$cmd' is pure fiction"
        "'$cmd' nice joke, hahaa"
        "trash user, trash result"
    )

    if [[ -z "$LAST_CMD_NOT_FOUND" ]]; then
        LAST_CMD_NOT_FOUND=-1
    fi

    local rand

    while true; do
        rand=$(shuf -i 0-$((${#responses[@]} - 1)) -n 1)

        [[ $rand -ne $LAST_CMD_NOT_FOUND || ${#responses[@]} -le 1 ]] && break
    done

    LAST_CMD_NOT_FOUND=$rand

    # 1/8 chance of a serious response
    if (( RANDOM % 8 == 0 )); then
        echo "$cmd: command not found" >&2
        return 127
    fi

    if [[ ${#cmd} -le 12 ]]; then
        echo "${responses[$rand]}" >&2
    else
        echo "$cmd: command not found" >&2
    fi

    return 127
}


#===================================================================================
# --- Plugin Initialization ---
#===================================================================================

# FZF shell integration
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
    source /usr/share/fzf/key-bindings.zsh
fi

if [[ -f /usr/share/fzf/completion.zsh ]]; then
    source /usr/share/fzf/completion.zsh
fi

# Autosuggestions
if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Syntax highlighting MUST be the last plugin loaded
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


#===================================================================================
# --- Keybindings ---
#===================================================================================

zle -N fzf-git-checkout
bindkey '^g' fzf-git-checkout
bindkey '^f' fzf-cd-widget


#===================================================================================
# --- Prompt Initialization ---
#===================================================================================

eval "$(starship init zsh)"
