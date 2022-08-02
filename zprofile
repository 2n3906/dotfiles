if [ -f "/opt/homebrew/bin/brew" ]; then
  # Homebrew on a M1 Mac
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi