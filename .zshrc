# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv export zsh)"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv hook zsh)"

# zsh config
export ZSH="/Users/dtillery/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# speed things up a bit
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
autoload -U bashcompinit && bashcompinit

# homebrew setup
if [ $(uname -m) = "arm64" ]; then
  # apple silicon
  export PATH="/opt/homebrew/bin:$PATH"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  # intel
  export PATH="/usr/local/sbin:$PATH"
fi

# python
export PIP_REQUIRE_VIRTUALENV=false

# nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# see https://github.com/ohmyzsh/ohmyzsh/issues/6835
ZSH_DISABLE_COMPFIX=true

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git direnv zsh-prompt-benchmark zsh-completions)

source $ZSH/oh-my-zsh.sh

# User configuration

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# source all .zsh files
for f ($HOME/scripts/zsh/*.zsh) . $f

# load work tools
source $HOME/.work/.workrc

unsetopt autocd

# eza completions
export FPATH="~/.misc/eza/completions/zsh:$FPATH"

# gst, for mopidy
export GST_PLUGIN_PATH="$GST_PLUGIN_PATH:/usr/local/Cellar/gst-plugins-base:/usr/local/Cellar/gst-plugins-good:/usr/local/Cellar/gst-plugins-ugly"

# Created by `pipx` on 2024-02-21 02:08:48
# setting at front of path to make sure you get these instead of pyenv shims
export PATH="/Users/dtillery/.local/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# postgres
export PATH="$PATH:/usr/local/opt/postgresql@16/bin"

# sublime text
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# mcfly
export MCFLY_RESULTS=20
export MCFLY_FUZZY=2
export MCFLY_INTERFACE_VIEW=TOP
export MCFLY_PROMPT="❯"
eval "$(mcfly init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
