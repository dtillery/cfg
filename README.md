# cfg
From [this blog post](https://www.atlassian.com/git/tutorials/dotfiles).

## install

### macos
```
defaults write -g ApplePressAndHoldEnabled -bool false
```

### basic
```
# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install openssl gpg

### python
```
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
 defaults write -g ApplePressAndHoldEnabled -bool false
brew install readline xz
brew install pyenv
pyenv install 2.7.15
pyenv install
```
