
#===================================================================================
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"


#===================================================================================
# --- Environment Variables ---
#===================================================================================

export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
export DOTNET_ROOT=/usr/share/dotnet
export PATH=$PATH:$DOTNET_ROOT:$HOME/.dotnet/tools
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
# --- Plugins (Arch Arch Linux Pacman paths) ---
#===================================================================================

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
#===================================================================================
#===================================================================================

#===================================================================================
# Aliases# --- Navigation & General Core ---
#===================================================================================
alias cls="clear"
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
alias updateall="sudo pacman -Syu"
alias del="sudo pacman -Rns"
alias ins="sudo pacman -S"
alias pls="sudo"
alias cleanup="sudo pacman -Rns \$(pacman -Qdtq)"
#===================================================================================
#===================================================================================

#===================================================================================
# --- Git Workflow Shortcuts ---
#===================================================================================
alias g="git"
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

