#!/usr/bin/env zsh

echo "\n<<< Starting ZSH  Setup >>>\n"


# Installation unecessary; ZSH install is in the Brewfile.

if grep -Fxq '/usr/local/bin/zsh' '/etc/shells';then
    echo  '/usr/local/bin/zsh alreade exists in /etc/shells'
else
echo "Enter superuser (sudo) password to edit /etc/shells"
echo '/usr/local/bin/zsh' | sudo tee -a '/etc/shells' >/dev/null
fi

if [ "$SHELL" = '/usr/local/bin/zsh ']; then
    echo 'SHELL is already /usr/local/bin/zsh'
else
echo "Enter user password to change login shell"
chsh -s '/usr/local/bin/zsh'
fi

