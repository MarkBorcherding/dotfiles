

# Turn off the spelling correct.
unsetopt correct_all

for file in ~/.{path,aliases}; do
  [ -r "$file" ] && source "$file"
done

# Show completion on first TAB
setopt menucomplete

[[ -s $HOME/.secrets ]] && source $HOME/.secrets

