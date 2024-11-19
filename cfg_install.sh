# clone and install
git clone --bare git@github.com:dtillery/cfg.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no

# make .config dir
mkdir -p .config

# make work dirs
mkdir -p .work
touch .work/.workrc

# ssh credentials/config
mkdir -p .ssh
touch .ssh/config

# aws credential/config location
mkdir -p .aws
touch .aws/credentials
touch .aws/config

# src dir
mkdir -p src


# make misc dirs
mkdir -p .misc
mkdir -p .logs