# sublime launch
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"

# config: custom cmd for configuration with "cfg" repo
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias ls='eza -hA --color --icons --sort=type'

alias whatismyip="dig +short myip.opendns.com @resolver1.opendns.com"
