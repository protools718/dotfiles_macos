
echo 'Hello from .zshrc'


# Set Variables

# Change ZSH Options

# Create Aliases
alias ll='ls -lAFh'

# Customize Prompt(s)
PROMPT='
%1~ %L %# '

RPROMPT='%*'

# Add Locations to $PATH Variable

# Write Handy Functions
function mkcd() {
	mkdir -p "$@" && cd "$_";
}

# Use ZSH Plugins

# ...And Other Surprises
