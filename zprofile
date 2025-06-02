if [ -f "/opt/homebrew/bin/brew" ]; then
  # Homebrew on a M1 Mac
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.poetry/bin" ] ; then
    PATH="$HOME/.poetry/bin:$PATH"
fi
