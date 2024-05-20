# cfg
Shamelessly based on [this blog post](https://www.atlassian.com/git/tutorials/dotfiles).

## install

### From Github
```bash
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# run install script
curl -Lks https://raw.githubusercontent.com/dtillery/cfg/master/cfg_install.sh | /bin/zsh

# source new .zshrc
. ~/.zshrc
```

If you're getting "no such file or directly found" errors for the curl, there's probably some weird bullshit characters in your c/p, so just retype it all.

You'll get errors related to later things that don't exist yet for zsh to source. Whatever, just install things and source later.

Need to fix the install script to correctly remove/backup existing files.

### macos
```bash
defaults write -g ApplePressAndHoldEnabled -bool false
```

### zsh
Install [powerlevel10k](https://github.com/romkatv/powerlevel10k) theme and completions, then re-source.

```bash
# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# zsh-completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
```

### homebrew
```bash
# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install openssl gpg libxml2
```

#### brews to tap

* awscli - for interacting with AWS
* [bat](https://github.com/sharkdp/bat) - better `cat`
* [cheat](https://github.com/cheat/cheat) - cheatsheets for common commands
* [csvlens](https://github.com/YS-L/csvlens) - cli CSV viewer
* [direnv](http://direnv.net) - for setting dir-specific environment variables (and executing whatever else)
* [delta](https://github.com/dandavison/delta) - better `diff`
* [duf](https://github.com/muesli/duf) - better `df`
* [dust](https://github.com/bootandy/dust) - better `du`
* [eza](https://eza.rocks) - better `ls`
* [fd](https://github.com/sharkdp/fd) - better `find`
* [fx](https://github.com/antonmedv/fx) - cli JSON viewer
* [mcfly](https://github.com/cantino/mcfly) - better `ctrl-r`
* [htop](https://htop.dev) - better `top`
* [hyperfine](https://github.com/sharkdp/hyperfine) - cli benchmarking tool
* [jq](https://jqlang.github.io/jq/) - cli JSON processor
* [pipx](https://pipx.pypa.io/stable/) - install and run sandboxed python commands
* [procs](https://github.com/dalance/procs) - better `ps`
* [pyenv](https://github.com/pyenv/pyenv) - manage python virtualenvs
* [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv) - additional virtualenv management
* [streamlink](https://streamlink.github.io) - for streaming... stuff
* watch - I guess watch doesn't come by default on macs?

### pipx
Install these via pipx for python project management and tooling:

* [black](https://black.readthedocs.io/en/stable/) - code formatter
* [poetry](https://python-poetry.org) - packaging and dependency management

### exiftool
I'm not sure how I originally installed exiftool. You can get it either from the
[site](https://exiftool.org/install.html#MacOS) itself or via homebrew (though it looks
like it's behind the most current version).
