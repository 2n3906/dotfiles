#! /bin/sh 

# --------------
# Inspiration:
# - https://github.com/kevinmcox/outset-scripts/blob/main/usr/local/outset/login-once/FinderSettings.sh
# - https://github.com/hamchapman/.dotfiles/blob/master/macos.sh
# - https://github.com/mathiasbynens/dotfiles/blob/main/.macos
#
# Manual steps that are hard to automate:
# - System Settings > Customize modifier keys: Caps Lock key = Command
# --------------

# XCODE COMMAND LINE TOOLS
if xcode-select -p &>/dev/null; then
    echo "Xcode Command Line Tools already installed."
else
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
    # Wait for installation to complete
    until xcode-select -p &>/dev/null; do
        sleep 5
    done
    echo "Xcode Command Line Tools installed."
fi

# HOMEBREW
if command -v brew &>/dev/null; then
    echo "Homebrew already installed."
else
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add Homebrew to PATH for Apple Silicon Macs
    if [ -f "/opt/homebrew/bin/brew" ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    echo "Homebrew installed."
fi

# KEYBOARD SPEED
echo "Setting keyboard repeat rate..."
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 2 # normal minimum is 2 (30 ms)

# SECURE KEYBOARD
echo "Securing keyboard..."
defaults write com.apple.terminal SecureKeyboardEntry 1
defaults write com.googlecode.iterm2 "Secure Input" 1

# SCROLLING CORRECTLY
echo "Setting scroll direction..."
defaults write -g com.apple.swipescrolldirection -bool false

# TOUCH TO CLICK
echo "Setting trackpad touch to click..."
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# MAKE SCROLLBARS VISIBLE AT ALL
echo "Making scrollbars visible..."
defaults write -g AppleShowScrollBars -string “Always”

# MAKE FINDER MORE USEFUL
echo "Setting finder preferences..."
defaults write com.apple.finder ShowPathbar -bool true

# SET UP DOCK
echo "Configuring dock..."
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock autohide -bool true

# SET UP DESKTOP
echo "Configuring desktop..."
defaults write com.apple.WindowManager StandardHideWidgets -bool true

# SCREENSHOTS
echo "Setting screenshots directory..."
mkdir -p ~/Desktop/Screenshots
defaults write com.apple.screencapture "location" -string "~/Desktop/Screenshots"
defaults write com.apple.screencapture "show-thumbnail" -bool false
killall SystemUIServer   # restart UI

# DISABLE HANDOFF
echo "Disabling Handoff..."
defaults -currentHost write com.apple.coreservices.useractivityd ActivityAdvertisingAllowed -bool no
defaults -currentHost write com.apple.coreservices.useractivityd ActivityReceivingAllowed -bool no
