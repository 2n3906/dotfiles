# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ~/.zshrc

# antibody plugins
#source ~/.zsh_plugins.sh
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme
# That's some next-level stuff
#POWERLEVEL9K_MODE='nerdfont-complete'
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs)
#DEFAULT_USER=$USER # suppress pl9k user display normally

#export PATH="/Users/johnston/bin:/usr/local/miniconda3/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# GPG 2.1.x SSH support
# See : http://incenp.org/notes/2015/gnupg-for-ssh-authentication.html
# also https://evilmartians.com/chronicles/stick-with-security-yubikey-ssh-gnupg-macos
export GPG_TTY=$(/usr/bin/tty)
#export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
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

# Load secret API keys, if they exist.
if [ -f $HOME/.apikeys ]; then
    source $HOME/.apikeys
fi
source $HOME/.zsh_exports
source $HOME/.zsh_aliases
source $HOME/.zsh_jupyter

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
