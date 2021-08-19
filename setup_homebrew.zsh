#!/usr/bin/env zsh

echo "\n<<< Starting Homebrew Setup >>>\n"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# TODO: 
# Unable to disable quarantine of casks because `brew bundle` does not have 
# the `--no-quarantine` option. It's currently exported in zshrc:
# export HOMEBREW_CASK_OPTS="--no-quarantine"


brew bundle --verbose
