


# Set Variables
# Syntax highlighting for man pages using bat
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export HOMEBREW_CASK_OPTS="--no-quarantine"
export NULLCMD=bat
export N_PREFIX="$HOME/.n"
export PREFIX="$N_PREFIX"

# Change ZSH Options

# Create Aliases
alias ll='exa -laFh --git'
alias exa='exa -laFh --git'
alias man=batman
alias bbd='brew bundle dump --force --describe'
alias trail='<<<${(F)path}'

# Customize Prompt(s)
PROMPT='
%1~ %L %# '

RPROMPT='%*'

# Add Locations to $path array.
typeset -U path

path=(
  "$N_PREFIX/bin"
  "/usr/local/sbin"
  "$HOME/.local/bin"
  $path
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
)

# Write Handy Functions
function mkcd() {
	mkdir -p "$@" && cd "$_";
}

# Use ZSH Plugins

## vim Mode
bindkey -v
export KEYTIMEOUT=1

## vim status indicator
## Init
setopt PROMPT_SUBST

## Options
THEME_PROMPT_PREFIX=${THEME_PROMPT_PREFIX:-''}
THEME_VI_INS_MODE_SYMBOL=${THEME_VI_INS_MODE_SYMBOL:-'λ'}
THEME_VI_CMD_MODE_SYMBOL=${THEME_VI_CMD_MODE_SYMBOL:-'ᐅ'}

## Set symbol for the initial mode
THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"

# on keymap change, define the mode and redraw prompt
zle-keymap-select() {
  if [ "${KEYMAP}" = 'vicmd' ]; then
    THEME_VI_MODE_SYMBOL="${THEME_VI_CMD_MODE_SYMBOL}"
  else
    THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
  fi
  zle reset-prompt
}
zle -N zle-keymap-select

# reset to default mode at the end of line input reading
zle-line-finish() {
  THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
}
zle -N zle-line-finish

# Fix a bug when you C-c in CMD mode, you'd be prompted with CMD mode indicator
# while in fact you would be in INS mode.
# Fixed by catching SIGINT (C-c), set mode to INS and repropagate the SIGINT,
# so if anything else depends on it, we will not break it.
TRAPINT() {
  THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
  return $(( 128 + $1 ))
}

PROMPT='$THEME_PROMPT_PREFIX%f%B%F{240}%1~%f%b %(?.%F{green}$THEME_VI_MODE_SYMBOL.%F{red}$THEME_VI_MODE_SYMBOL) '




# ...And Other Surprises


# Init for starship
eval "$(starship init zsh)"

# launch neofetch when launching cli
neofetch

