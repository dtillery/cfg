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
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# gst, for mopidy
export GST_PLUGIN_PATH="$GST_PLUGIN_PATH:/usr/local/Cellar/gst-plugins-base:/usr/local/Cellar/gst-plugins-good:/usr/local/Cellar/gst-plugins-ugly"

# config: custom cmd for configuration with "cfg" repo
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# sublime launch
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# speed things up a bit
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
autoload -U bashcompinit && bashcompinit

# python
export PIP_REQUIRE_VIRTUALENV=false
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path --no-rehash)"
# eval "$(pyenv virtualenv-init -)"
# speed up prompt with below, but breaks "pyenv activate/deactivate"
# https://github.com/pyenv/pyenv-virtualenv/issues/259#issuecomment-1731123922
eval "$(pyenv virtualenv-init - | sed s/precmd/chpwd/g)"
_pyenv_virtualenv_hook
# eval "$(register-python-argcomplete pipx)"
export PIPX_DEFAULT_PYTHON="$HOME/.pyenv/versions/3.12.2/bin/python"

# load work tools
source $HOME/.work/.workrc

# load random scripts
source $HOME/.random

# nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# see https://github.com/ohmyzsh/ohmyzsh/issues/6835
ZSH_DISABLE_COMPFIX=true

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# * "pyenv" plugin makes prompt slow right now, as mentioned above
plugins=(git direnv zsh-prompt-benchmark zsh-completions)

source $ZSH/oh-my-zsh.sh

# User configuration

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

unsetopt autocd
# Created by `pipx` on 2024-02-21 02:08:48
export PATH="/Users/dtillery/.local/bin:$PATH"

# for homebrew
export PATH="/usr/local/sbin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# postgres
export PATH="/usr/local/opt/postgresql@16/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
