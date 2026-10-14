# ~/.zprofile: read once per login shell. Keep it fast and light — anything
# expensive belongs in ~/.zshrc, which only runs for interactive shells.

# Homebrew on macOS: Apple Silicon (/opt/homebrew) or Intel (/usr/local).
for _brew in /opt/homebrew/bin/brew /usr/local/bin/brew; do
  if [[ -x $_brew ]]; then
    eval "$($_brew shellenv)"
    break
  fi
done
unset _brew

# Prepend user-local bin directories to PATH if they exist.
# In zsh, `path` is the array form of PATH and stays in sync with it;
# `typeset -U` keeps it free of duplicates if this file is sourced twice.
typeset -U path
for _dir in \
  $HOME/bin \
  $HOME/.local/bin \
  $HOME/.cargo/bin \
  $HOME/.poetry/bin
do
  [[ -d $_dir ]] && path=($_dir $path)
done
unset _dir