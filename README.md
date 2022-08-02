Dotfiles
========

After cloning this repo, run `install` to automatically set up the development
environment. Note that the install script is idempotent: it can safely be run
multiple times.

Dotfiles uses [Dotbot][dotbot] for installation.

[dotbot]: https://github.com/anishathalye/dotbot

## Mac installation

 * `git clone git@github.com:2n3906/dotfiles.git .dotfiles`
 * Go to Settings > Keyboard > Modifier Keys.  Set Caps Lock to Command, set keyboard repeat rate to max and delay to min.
 * Install xcode command-line tools: `xcode-select --install`
 * Install Homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
 * Install Homebrew casks
 * iTerm2 > Preferences > Profiles > Text and select font "MesloLGS NF"
