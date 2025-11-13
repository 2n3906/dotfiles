# Installing stuff

`sudo apt install 1password sway zsh`

Manual font installation for powerlevel10k Meslo fonts.

# Getting Sway to work on Ubuntu 20.04

Edit /etc/gdm3/custom.conf and comment out the WaylandEnable=false line.
WaylandEnable=false prevents sway from being listed as a login shell.

```
# Uncoment the line below to force the login screen to use Xorg
#WaylandEnable=false
```

apt-install wofi for the launcher on Sway/Wayland
apt-install light for backlight control on Sway
... light won't work until reboot because it installs udev rules for 90-backlight
... add yourself to video group: `sudo usermod -aG video $USER`

## TODO ##

Open or Toggle 1Password 	1password --toggle 	Ctrl + p
Lock 1Password 	1password --lock 	Ctrl + Shift + L
Open Quick Access 	1password --quick-access 	Ctrl + Shift + Space

Add these:

bindsym Ctrl+Shift+l 1password --lock
byndsym Ctrl+Shift+space exec 1password --quick-access

and consider adding

exec eval $(gnome-keyring-daemon --start)
exec export SSH_AUTH_SOCK


## If you are SSHin'g in from Ghostty, it may be necessary to configure terminfo for xterm-ghostty
# Do this by forwarding it over ssh:
# infocmp -x | ssh YOUR-SERVER -- tic -x -


# Keyboard repeat rate
```
gsettings set org.gnome.desktop.peripherals.keyboard delay 250
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30
```
