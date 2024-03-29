Dotfiles
========

After cloning this repo, run `install` to automatically set up the development
environment. Note that the install script is idempotent: it can safely be run
multiple times.

Dotfiles uses [Dotbot][dotbot] for installation.

[dotbot]: https://github.com/anishathalye/dotbot

## Mac installation

 * `git clone git@github.com:2n3906/dotfiles.git ~/.dotfiles`
 * Go to Settings > Keyboard > Modifier Keys.  Set Caps Lock to Command, set keyboard repeat rate to max and delay to min.
 * Install xcode command-line tools: `xcode-select --install`
 * Install Homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
 * Install Homebrew casks (run `brew bundle` in the same directory as the `Brewfile`)
 * run `p10k configure` within a iTerm2 window to allow Powerlevel10k to set the iTerm2 font to `MesloLGS NF`
