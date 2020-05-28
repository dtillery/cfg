# cfg
Shamelessly based on [this blog post](https://www.atlassian.com/git/tutorials/dotfiles).

## install

### From Github
```
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# run install script
curl -Lks https://raw.githubusercontent.com/dtillery/cfg/master/cfg_install.sh | /bin/zsh

# source new .zshrc
. ~/.zshrc
```

If you're getting "no such file or directly found" errors for the curl, there's probably some weird bullshit characters in your c/p, so just retype it all.

You'll get errors related to later things that don't exist yet for zsh to source. Whatever, just install things and source later.

Need to fix the install script to correctly remove/backup existing files.

### macos
```
defaults write -g ApplePressAndHoldEnabled -bool false
```

### zsh
```
# zsh-completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
```

### homebrew
```
# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install openssl gpg libxml2
```

### python
```
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
 defaults write -g ApplePressAndHoldEnabled -bool false
brew install readline xz
brew install pyenv
brew instsall pyenv-virtualenv
git clone git://github.com/concordusapps/pyenv-implict.git ~/.pyenv/plugins/pyenv-implict
pyenv install 2.7.15
pyenv install
```

### k8s
```
brew install kubernetes-cli
```
