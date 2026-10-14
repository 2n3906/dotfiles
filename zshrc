# Only configure interactive shells. Without this guard, scp/rsync and
# `zsh -c` sessions would pay the full cost of compinit + starship below.
[[ -o interactive ]] || return

# Pin emacs key bindings so the arrow-key/search bindings below behave
# predictably regardless of what set -o emacs earlier.
bindkey -e

# Add homebrew autocompletions (Mac only)
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# Should be called before compinit
zmodload zsh/complist

# Enable autocompletions, with zsh's completion cache enabled so we don't
# rebuild the dump on every shell start.
autoload -Uz compinit
zstyle ':completion:*' use-cache on
_cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/compcache"
mkdir -p "$_cache_dir" 2>/dev/null
zstyle ':completion:*' cache-path "$_cache_dir"
compinit -d "$_cache_dir/.zcompdump"

_comp_options+=(globdots)             # Complete hidden files
zstyle ':completion:*' special-dirs true  # Also offer '.' and '..'

# setopt GLOB_COMPLETE      # Show autocompletion menu with globs
# setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.

setopt noclobber
unsetopt beep               # No audible feedback on errors/tab
setopt noflowcontrol         # Keep Ctrl-S from freezing the terminal on macOS

# Use up/down arrows to search through history
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt EXTENDED_HISTORY      # Timestamps + duration; improves the arrow-key search
setopt HIST_IGNORE_ALL_DUPS  # A new duplicate drops the older ones
setopt HIST_REDUCE_BLANKS    # Trim trailing spaces before saving
setopt HIST_SAVE_NO_DUPS     # Don't save duplicates to the file
setopt HIST_EXPIRE_DUPS_FIRST

if [[ $OSTYPE == darwin* ]]; then
  # Mac-specific stuff
  export CLICOLOR=1
  [[ -r "${HOME}/.iterm2_shell_integration.zsh" ]] && source "${HOME}/.iterm2_shell_integration.zsh"
fi

# Load secret API keys and shared config, if they exist.
[[ -f "$HOME/.apikeys" ]]      && source "$HOME/.apikeys"
[[ -f "$HOME/.zsh_exports" ]]  && source "$HOME/.zsh_exports"
[[ -f "$HOME/.zsh_aliases" ]]  && source "$HOME/.zsh_aliases"

# Starship prompt!
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi