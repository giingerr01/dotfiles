
#===================================================================================
# startup inits
#===================================================================================
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

#===================================================================================
#ripgrep+fzf
#===================================================================================
rgf() {
  # 1. Run rg initially, or rerun it interactively with fzf
  RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
  
  local initial_query="${*:-}"
  
  FZF_DEFAULT_COMMAND="$RG_PREFIX $(printf %q "$initial_query")" \
    fzf --ansi \
        --disabled \
        --query "$initial_query" \
        --bind "change:reload:eval:$RG_PREFIX {q} || true" \
        --delimiter : \
        --preview 'bat --style=numbers --color=always --highlight-line {2} {1}' \
        --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
        --bind 'enter:execute(nvim +{2} {1})+abort'
}

#===================================================================================
#===================================================================================

#===================================================================================
#===================================================================================
export MOZ_ENABLE_WAYLAND=1


#===================================================================================
#FzF customization
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
#file searching
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'

# Use fd when triggering Ctrl-T
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Preview window configuration for files
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always --line-range :500 {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'
"
# Use fd to find directories
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

# Preview directory contents using eza
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always --level=2 {} | head -200'"

#command history
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window down:3:wrap:hidden
  --bind 'ctrl-/:toggle-preview'
  --bind 'alt-y:execute-silent(echo -n {2..} | xclip -selection clipboard)+abort'
  --header 'Press CTRL-/ to toggle preview | ALT-Y to copy command'
"
# Interactive Git Checkout (Branches)
fzf-git-checkout() {
  local branch
  branch=$(git branch -a --color=always | grep -v '/HEAD\s' | sed 's/^..//' | fzf --ansi \
    --preview 'git log --graph --oneline --color=always --max-count=50 {1}' \
    --prompt="Checkout Branch > ")
  
  if [ -n "$branch" ]; then
    # Clean up branch name (remove remotes/ origin/ prefixes if selected)
    branch=$(echo "$branch" | tr -d '[:space:]' | sed 's#origin/##')
    git checkout "$branch"
  fi
}

# Bind it to a shortcut, e.g., Ctrl-G Ctrl-B
zle -N fzf-git-checkout

bindkey '^g' fzf-git-checkout
bindkey '^f' fzf-cd-widget

#===================================================================================
#===================================================================================

#===================================================================================
# --- Environment Variables ---
#===================================================================================

export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
export DOTNET_ROOT=/usr/share/dotnet
export PATH=$PATH:$DOTNET_ROOT:$HOME/.dotnet/tools
alias fkill="ps -ef | sed 1d | fzf -m | awk '{print \$2}' | xargs kill -9"
#===================================================================================
#===================================================================================

#===================================================================================
# --- Zsh Options ---
#===================================================================================

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY          # Share history across terminals
setopt HIST_IGNORE_ALL_DUPS   # Do not record duplicate entries
#===================================================================================
#===================================================================================

#===================================================================================
# --- Source Pywal Colors (if generated) ---
#===================================================================================

[ -f ~/.cache/wal/sequences ] && cat ~/.cache/wal/sequences
[ -f ~/.cache/wal/colors-tty.sh ] && source ~/.cache/wal/colors-tty.sh
#===================================================================================
#===================================================================================

#===================================================================================
# mkcd(make dirctory and cd into it)
#===================================================================================
mkcd() {
  mkdir -p "$1" && cd "$1"
}
#===================================================================================
#===================================================================================

#===================================================================================
#compinit
#===================================================================================

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case-insensitive completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"     # Colored completions
fpath=(/usr/share/zsh/site-functions/ $fpath)
autoload -Uz compinit && compinit

#===================================================================================
#===================================================================================


#===================================================================================
# --- Plugins (Arch Arch Linux Pacman paths) ---
#===================================================================================

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

#fzf integraations
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
#===================================================================================
#===================================================================================

#===================================================================================
# Aliases# --- Navigation & General Core ---
#===================================================================================

alias cls="clear"
alias cat="bat"
alias ff="fzf"
alias top="btop"
alias du="ncdu"
alias q="exit"
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
#===================================================================================
#===================================================================================

#===================================================================================
# --- Modern Eza (Exa) File Listings ---
#===================================================================================

alias ls="eza --icons=auto --group-directories-first"
alias l="eza -lbF --git --icons=auto"
alias ll="eza -la --icons=auto --group-directories-first"
alias la="eza -a --icons=auto"
alias lt="eza --tree --level=2 --icons=auto"
alias lta="eza --tree --level=2 -a --icons=auto"
#===================================================================================
#===================================================================================


#===================================================================================
# Sort listings
#===================================================================================

alias lsize="eza -la --sort=size --icons=auto"
alias ldate="eza -la --sort=date --icons=auto"
#===================================================================================
#===================================================================================

#===================================================================================
# --- Editors & Configuration Management ---
#===================================================================================

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
#===================================================================================
#===================================================================================

#===================================================================================
# --- Arch Linux / Pacman ---
#===================================================================================

alias suup="sudo pacman -Syu"
alias del="sudo pacman -Rns"
alias ins="sudo pacman -S"
alias pls="sudo"
alias cleanup="sudo pacman -Rns \$(pacman -Qdtq)"
alias mirrors="sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"
alias yayup="yay -Syu"
alias yayin="yay -S"
#===================================================================================
#===================================================================================

#===================================================================================
# --- Git Workflow Shortcuts ---
#===================================================================================

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
#===================================================================================
#===================================================================================

#===================================================================================
# --- Rofi / Pywal Custom Executables ---
#===================================================================================

alias wall="rofi-wallpaper"
alias sw="setwal"
alias ss="screenshot.sh"
#===================================================================================
#===================================================================================


#===================================================================================
# hahahha!!!
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
    rand=$(shuf -i 0-$((${#responses[@]}-1)) -n 1)
    [[ $rand -ne $LAST_CMD_NOT_FOUND || ${#responses[@]} -le 1 ]] && break
  done
  LAST_CMD_NOT_FOUND=$rand

  # 1/8 chance of being serious
  if (( RANDOM % 8 == 0 )); then
    echo "$cmd: command not found" >&2
    return 127
  fi

  # only roast short commands
  if [ ${#cmd} -le 12 ]; then
    echo "${responses[$rand]}" >&2
  else
    echo "$cmd: command not found" >&2
  fi

  return 127
}

eval "$(starship init zsh)"
