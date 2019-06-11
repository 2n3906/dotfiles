# ~/.zshrc

# antibody plugins
source ~/.zsh_plugins.sh

# That's some next-level stuff
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs)
DEFAULT_USER=$USER # suppress pl9k user display normally

export PATH="/Users/johnston/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# GPG 2.1.x SSH support
# See : http://incenp.org/notes/2015/gnupg-for-ssh-authentication.html
# also https://evilmartians.com/chronicles/stick-with-security-yubikey-ssh-gnupg-macos
export GPG_TTY=$(/usr/bin/tty)
export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
gpgconf --launch gpg-agent
# consider sleepwatcher

setopt noclobber

# Use up/down arrows to search through history
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

if [[ $OSTYPE == darwin* ]]; then
  export CLICOLOR=1
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi

source $HOME/.apikeys
source $HOME/.zsh_exports
source $HOME/.zsh_aliases
source $HOME/.zsh_jupyter
