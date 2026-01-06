# First-time setup notes
For configuring new machines.

## Mac

1. Run `./bootstrap-mac.sh` to install homebrew and configure some sensible defaults.
2. (Optional: reboot for settings to become active.)
3. Run `brew bundle` in the directory with `Brewfile` to install basic software.
4. Transfer ssh keypair to new machine.
5. Clone dotfiles and install them.

## Other Resources

Mac:
https://github.com/dstroot/.osx/tree/master/defaults
https://github.com/herrbischoff/awesome-macos-command-line

Windows:
https://github.com/Disassembler0/Win10-Initial-Setup-Script

Linux:
 * Install lightline for vim: git clone https://github.com/itchyny/lightline.vim ~/.vim/pack/plugins/start/lightline
 * Install tmuxline for vim: git clone https://github.com/edkolev/tmuxline.vim ~/.vim/pack/plugins/start/tmuxline.vim

Latest Linux setup from 2020:

 * Build redshift from source:
   -  apt-get install inttools libwayland-dev
   -  https://github.com/minus7/redshift.git (wayland branch)
   - ./configure --enable-wayland --enable-geoclue2
   - make ; make install
   - edit systemd service file per this patch: https://github.com/WhyNotHugo/redshift/blob/6ceecc4aebabfd8849733911edff16ca9a68e424/data/systemd/redshift.service.in
   - systemctl --user enable redshift
   - systemctl --user start redshift

