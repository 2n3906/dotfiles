Dotfiles
========

After cloning this repo, run `install` to automatically set up the development
environment. Note that the install script is idempotent: it can safely be run
multiple times.

Dotfiles uses [Dotbot][dotbot] for installation.

[dotbot]: https://github.com/anishathalye/dotbot

## Mac installation

 * Open Terminal, run `git clone https://github.com/2n3906/dotfiles.git ~/.dotfiles`
 * Run `~/.dotfiles/SETUP/bootstrap-mac.sh` to install homebrew and configure basic defaults. Log out and log in again.
 * Go to Settings > Keyboard > Modifier Keys.  Set Caps Lock to Command, set keyboard repeat rate to max and delay to min.
 * Run `brew bundle` in the same directory as before to install apps.
 * Open 1Password and enable the SSH agent in the settings.
 * Run `./install` inside the `.dotfiles` directory to install dotfiles.
