# cfg
Shamelessly based on [this blog post](https://www.atlassian.com/git/tutorials/dotfiles).

## Todo
* [ ] Handle existing files within install script.
* [ ] write cheats for
    * [ ] brew commands (leaves)
    * [ ] pipx (specific pyenv version)

## install

### MacOS
Change some MacOS defaults (requires restart).

```bash
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g com.apple.swipescrolldirection -bool false
```

**Download XCode on app store.**

### Copy or Generate Keys
Creating new public and private keys will require updates in all relevant locations (github, servers, etc.)

#### SSH
```bash
mkdir -p .ssh
cd .ssh
ssh-keygen -t rsa -b 4096 -C "djtillery@gmail.com"
```

#### AWS
Generate new  `aws_acccess_key_id` and `aws_secret_access_key` into `.aws/credentials`.

### Install zsh and powerlevel10k
Install [powerlevel10k](https://github.com/romkatv/powerlevel10k) theme and completions, then re-source.

```bash
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# zsh-completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
```

### Run Install Script
Git can't clone a repository and overwrite existing files. That means that everything in this cfg repo
**must** not exist already, or the script will fail until you remove them. In practice, this
means you most likely will need to delete the `.zshrc` file generated when installing oh-my-zsh.


```bash
# run install script
curl -Lks https://raw.githubusercontent.com/dtillery/cfg/master/cfg_install.sh | /bin/zsh

# source new .zshrc
. ~/.zshrc
```

If you're getting "no such file or directly found" errors for the curl, there's probably some weird bullshit characters in your c/p, so just retype it all.

You'll get errors related to later things that don't exist yet for zsh to source
(setup commands, tool aliases, etc). This is OK, just proceed to install them afterwards.

### Homebrew
Install homebrew:

```bash
# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install openssl gpg libxml2 xz ffmpeg
```

Install these tools via homebrew:

* awscli - for interacting with AWS
* [bat](https://github.com/sharkdp/bat) - better `cat`
* [cheat](https://github.com/cheat/cheat) - cheatsheets for common commands
* [csvlens](https://github.com/YS-L/csvlens) - cli CSV viewer
* [direnv](http://direnv.net) - for setting dir-specific environment variables (and executing whatever else)
* [delta](https://github.com/dandavison/delta) - better `diff`
* [duf](https://github.com/muesli/duf) - better `df`
* [dust](https://github.com/bootandy/dust) - better `du`
* [exiftool](https://exiftool.org) - read and write image EXIF metadata (not up to date with home download)
* [eza](https://eza.rocks) - better `ls`
* [fd](https://github.com/sharkdp/fd) - better `find`
* [fx](https://github.com/antonmedv/fx) - cli JSON viewer
* [himalaya](https://github.com/pimalaya/himalaya) - cli email library (need 1.0.0-beta.4)
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
Set the global pyenv python version:
```bash
pyenv global 3.13.0
```
Install these via pipx for python project management and tooling:

* [black](https://black.readthedocs.io/en/stable/) - python code formatter
* [mypy](https://mypy.readthedocs.io/en/stable/) - python code linter
* [poetry](https://python-poetry.org) - python packaging and dependency management

Install other useful tools:

* [rexi](https://github.com/royreznik/rexi) - interactive regex evaluation tool

Optionally install personal apps:

```bash
pipx install git+ssh://git@github.com/dtillery/recyoself.git
pipx install git+ssh://git@github.com/dtillery/travelers.git
pipx install git+ssh://git@github.com/dtillery/kkjukebox.git
pipx install git+ssh://git@github.com/dtillery/biteme.git
```

## New Computer Setup (WIP)

* Go through initial setup screens
    * set Account Name to "dtillery"
* Change Mac Settings
    * change scroll direction
    * change key repeat/delay rates
    * Add keyboard shortcuts for spaces (under keyboard shortcuts > mission control)
* Add google account
    * mail
    * contacts
    * calendars
* run cfg, install cli tools
* Install Important Apps
    * 1Password
    * Alfred
    * iTerm2
    * BetterTouchTool
    * SublimeText
    * Xcode
    * Bartender
    * Moom
    * Dash (v4)
    * lightroom
    * Daisy Disk
    * App Store apps
* General Settings
    * iCloud Private Relay
* Transfer Files (Target Disk Mode)
    * Music
        * Copy exactly, then hold option and open Music to choose library.
    * Photos
        * Avoid Photos library and Lightroom
    * Movies
    * Documents
