################################################################################
# ~/.zshrc — macOS, organized, documented
# Goal: Fast startup, robust history, fuzzy completion, minimal plugins.
# All sections are self-contained and safe to source multiple times.
################################################################################

################################################################################
# 0) macOS Environment Setup
################################################################################
# Purpose: Set up core environment variables and PATH for macOS tools.

# Homebrew: Add Homebrew to PATH if installed (Apple Silicon default path)
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# MacPorts: Add MacPorts to PATH if installed (optional, rarely used on macOS)
if [[ -d /opt/local/bin ]]; then
    export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
fi

# Codeium (Windsurf): Prepend Codeium binaries to PATH
export PATH="${HOME}/.codeium/windsurf/bin:${PATH}"

# pipx: User-installed CLI tools
export PATH="${HOME}/.local/bin:${PATH}"

# Antigravity: Prepend Antigravity binaries to PATH
export PATH="${HOME}/.antigravity/antigravity/bin:${PATH}"

################################################################################
# 1) Shell Mode and Keymap
################################################################################
# Use the emacs keymap as a base for Zsh line editing.
bindkey -e

################################################################################
# 2) Early Environment and Python Virtualenv
################################################################################
# Purpose: Define PATH and activate Python venv before plugins alter state.

# Python venv: Auto-activate if the specific venv exists.
[[ -f "${HOME}/PyPiP/bin/activate" ]] && source "${HOME}/PyPiP/bin/activate"

# Time reporting: Print elapsed time for commands taking >1s.
REPORTTIME=1

################################################################################
# 3) History Settings
################################################################################
# Purpose: Durable, deduplicated, and shareable history across sessions.

HISTSIZE=50000
SAVEHIST=$HISTSIZE
HISTFILE="${HOME}/.zsh_history"

# History deduplication and behavior options.
setopt APPEND_HISTORY          # Append rather than overwrite.
setopt SHARE_HISTORY           # Merge history across sessions.
setopt HIST_IGNORE_ALL_DUPS    # Drop older duplicates.
setopt HIST_IGNORE_DUPS        # Ignore immediate duplicate entries.
setopt HIST_IGNORE_SPACE       # Ignore commands starting with a space.
setopt HIST_FIND_NO_DUPS       # Avoid duplicate matches in search.
setopt HIST_SAVE_NO_DUPS       # Do not write duplicates to file.

################################################################################
# 4) fzf Setup (Fuzzy Finder Integration)
################################################################################
# Purpose: Consistent color previews and default options for fzf.

# fzf-tab: Preview files when completing `cd` and `zoxide` targets.
zstyle ':fzf-tab:complete:cd:*'           fzf-preview 'eza --color=always "$realpath"'
zstyle ':fzf-tab:complete:__zoxide_z:*'   fzf-preview 'eza --color=always "$realpath"'

# fzf default color scheme (Catppuccin-like).
export FZF_DEFAULT_OPTS=" \
--color=bg+:#3B4252,bg:#2E3440,spinner:#8FBCBB,hl:#81A1C1 \
--color=fg:#ECEFF4,header:#8FBCBB,info:#A3BE8C,pointer:#BF616A \
--color=marker:#EBCB8B,fg+:#ECEFF4,prompt:#88C0D0,hl+:#B48EAD \
--color=selected-bg:#434C5E \
--color=border:#4C566A,label:#D8DEE9"

# fzf init: Load user install script if fzf is present.
if command -v fzf &>/dev/null && [[ -f "${HOME}/.fzf.zsh" ]]; then
  source "${HOME}/.fzf.zsh"
fi

################################################################################
# 5) Zinit Plugin Management (Fast Plugin Loader)
################################################################################
# Purpose: On-demand plugin install and load with minimal overhead.

# Zinit install path.
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Install zinit if missing.
if [[ ! -d "${ZINIT_HOME}" ]]; then
  mkdir -p "$(dirname "${ZINIT_HOME}")"
  git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT_HOME}"
fi

# Load zinit and core completions, then declare plugins.
if [[ -f "${ZINIT_HOME}/zinit.zsh" ]]; then
  source "${ZINIT_HOME}/zinit.zsh"

  # Rebuild completion dump at most once per day.
  autoload -Uz compinit
  _zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ ! -f "$_zcompdump" || -n "$( find "$_zcompdump" -mmin +1440 2>/dev/null )" ]]; then
    compinit
  else
    compinit -C
  fi

  # Lightweight, commonly used plugins.
  zinit light zsh-users/zsh-syntax-highlighting
  zinit light zsh-users/zsh-completions
  zinit light zsh-users/zsh-autosuggestions
  zinit light Aloxaf/fzf-tab
  zinit light hlissner/zsh-autopair

  # Oh-My-Zsh plugin snippets via zinit.
  zinit snippet OMZP::brew
  zinit snippet OMZP::colored-man-pages
  zinit snippet OMZP::colorize
  zinit snippet OMZP::command-not-found
  zinit snippet OMZP::common-aliases
  zinit snippet OMZP::eza
  zinit snippet OMZP::git
  zinit snippet OMZL::git.zsh
  zinit snippet OMZP::kitty
  zinit snippet OMZP::pip
  zinit snippet OMZP::python
  zinit snippet OMZP::rsync
  zinit snippet OMZP::sudo
  zinit snippet OMZP::zsh-interactive-cd

  # Restore working directories from previous session.
  zinit cdreplay -q
fi

################################################################################
# 6) External Tools and Integrations
################################################################################
# starship: Fast, customizable prompt.
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

################################################################################
# 7) Aliases and Small Helpers
################################################################################
# Purpose: Short, memorable commands for frequent actions.

# Default editor
export EDITOR="nvim"
export VISUAL="nvim"

# Navigation
alias home='cd ~'
alias desktop='cd ~/Desktop'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Info and utilities
alias h='history'
alias df='df -h'
alias du='du -sh'
alias today='date "+%Y-%m-%d"'
alias now='date "+%H:%M:%S"'
alias getip='curl ifconfig.me'

# Monitoring
alias top='btop'
alias cpu='btop'

# Listing with eza
alias l='eza -lh'
alias l2='eza -lh --tree --level=2'
alias ll='eza -alF'
alias ls='eza --color=auto'
alias lsa='eza -A'

# Quality of life
alias c='clear'
alias cat='bat'
alias venv='source ~/PyPiP/bin/activate'
alias vi='nvim'
alias vim='nvim'
alias pdf-build='latexmk -pdf -lualatex'

# mkz: Create a directory and enter it using zoxide
mkz() {
  mkdir -p -- "$1" && cd -- "$1" || return
}

################################################################################
# 8) Editing Keys for Kitty Terminal (macOS)
################################################################################
# Purpose: Interpret Kitty's escape sequences inside ZLE for line editing.
# Baseline: Kitty sends these sequences per your kitty.conf mappings.

# Forward Delete
bindkey '^[[3~' delete-char

# Insert
bindkey '^[[2~' overwrite-mode

# Home / End
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# Alternates (some terminfo variants)
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

# Page Up / Page Down — history search by prefix
bindkey '^[[5~' history-beginning-search-backward
bindkey '^[[6~' history-beginning-search-forward

# GPG Agent: Use graphical pinentry for GPG on macOS
GPG_TTY=$(tty)
export GPG_TTY

# eza: Customize the appearance of the ls command
export EZA_CONFIG_DIR="$HOME/.config/eza"

################################################################################
# End of ~/.zshrc (macOS)
# zoxide must be last — it hooks `cd` and anything after it could shadow that.
################################################################################
# zoxide: Smarter `cd` with frecency ranking; replaces the built-in cd.
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh --cmd cd)"
fi
