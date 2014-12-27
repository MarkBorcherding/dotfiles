source ~/.bashrc

export POWERLINE_PATH="$(pip show powerline-status | grep "^Location: "  | grep -o '/.*')/powerline"
powerline-daemon -q
