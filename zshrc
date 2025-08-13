# Add homebrew autocompletions (Mac only)
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# Should be called before compinit
zmodload zsh/complist

# Enable autocompletions
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files

# setopt GLOB_COMPLETE      # Show autocompletion menu with globs
# setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.

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

# Starship prompt!
eval "$(starship init zsh)"
