# Fast Node Manager 
# https://github.com/Schniz/fnm
eval "$(fnm env --use-on-cd --shell zsh --version-file-strategy=recursive)"

# Generate autocomplete script for fnm if it doesn't exist
if [[ ! -f "$HOME/.zfunc/_fnm" ]]; then
  mkdir -p "$HOME/.zfunc" &&
    fnm completions --shell zsh > "$HOME/.zfunc/_fnm"
fi

# Load autocomplete script
fpath=(~/.zfunc $fpath)