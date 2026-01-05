#! /bin/sh 

# -------------
# Inspiration:
# - https://github.com/kevinmcox/outset-scripts/blob/main/usr/local/outset/login-once/FinderSettings.sh
# --------------

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

# MAKE SCROLLBARS VISIBLE AT ALL
echo "Making scrollbars visible..."
defaults write -g AppleShowScrollBars -string “Always”

# MAKE FINDER MORE USEFUL
echo "Setting finder preferences..."
defaults write com.apple.finder ShowPathbar -bool true

# SCREENSHOTS
echo "Setting screenshots directory..."
mkdir ~/Desktop/Screenshots
defaults write com.apple.screencapture "location" -string "~/Desktop/Screenshots"
defaults write com.apple.screencapture "show-thumbnail" -bool false
killall SystemUIServer   # restart UI

# DISABLE HANDOFF
echo "Disabling Handoff..."
defaults -currentHost write com.apple.coreservices.useractivityd ActivityAdvertisingAllowed -bool no
defaults -currentHost write com.apple.coreservices.useractivityd ActivityReceivingAllowed -bool no
