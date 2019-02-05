# ~/.zshrc
source <(antibody init)

antibody bundle zsh-users/zsh-completions
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle unixorn/warhol.plugin.zsh

# These should be last
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs)
antibody bundle bhilburn/powerlevel9k
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-history-substring-search

export PATH="/Users/johnston/bin:/usr/local/bin:/Applications/Postgres.app/Contents/Versions/latest/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/texlive/2017basic/bin/x86_64-darwin:$HOME/adb-fastboot/platform-tools"
# export MANPATH="/usr/local/man:$MANPATH"

# GPG 2.1.x SSH support
# See : http://incenp.org/notes/2015/gnupg-for-ssh-authentication.html
# also https://evilmartians.com/chronicles/stick-with-security-yubikey-ssh-gnupg-macos
export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
gpgconf --launch gpg-agent
# consider sleepwatcher

setopt noclobber


alias ls='ls -F'

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

source ~/.apikeys

if [[ $OSTYPE == darwin* ]]; then
  export CLICOLOR=1
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

  alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
  alias afk="open -a /System/Library/CoreServices/ScreenSaverEngine.app"
fi
