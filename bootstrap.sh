grep Ubuntu /proc/version && \
  sudo apt-get update && \
  sudo apt-get --quiet --yes install git

sudo easy_install pip
sudo pip install paramiko PyYAML jinja2 httplib2

