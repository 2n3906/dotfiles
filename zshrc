# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -r /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme ]]; then
  source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme
fi

setopt noclobber

# Use up/down arrows to search through history
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

if [[ $OSTYPE == darwin* ]]; then
  # Mac-specific stuff
  export CLICOLOR=1
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi

# Load secret API keys, if they exist.
if [ -f $HOME/.apikeys ]; then
    source $HOME/.apikeys
fi
source $HOME/.zsh_exports
source $HOME/.zsh_aliases

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
