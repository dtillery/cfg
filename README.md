# cfg
From [this blog post](https://www.atlassian.com/git/tutorials/dotfiles).

## install

### macos
```
defaults write -g ApplePressAndHoldEnabled -bool false
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