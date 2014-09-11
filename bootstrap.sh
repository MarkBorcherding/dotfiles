grep Ubuntu /proc/version && \
  sudo apt-get update && \
  sudo apt-get --quiet --yes install git

[ uname == 'Darwin' ] && \
  brew install git

which pip
[ $? != 0 ] && sudo easy_install pip

sudo pip install paramiko PyYAML jinja2 httplib2
