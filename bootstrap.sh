set -xe

grep Ubuntu /proc/version && \
  sudo apt-get update && \
  sudo apt-get --quiet --yes install git

[ uname == 'Darwin' ] && \
  brew install git

# which pip
# [ $? != 0 ] && sudo easy_install pip

# sudo pip install paramiko PyYAML jinja2 httplib2

git clone git@github.com:MarkBorcherding/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git co ansible
git submodule init
git submodule update
