---
title: WORKFLOW
aliases: WORKFLOW
linter-yaml-title-alias: WORKFLOW
date created: Friday, March 6th 2026, 9:35:11 pm
date modified: Friday, March 6th 2026, 9:39:07 pm
---

## csDots: Configuration Layout and Sync Workflow

This document describes the structure of the csDots dotfiles repository and

the operation of the `update-dotfiles.sh` synchronisation script.

---

### Repository Overview

The repository is managed by YADM and mirrors the structure of `$HOME`. All

paths below are relative to the home directory.

```
~
├── .bashrc                        # Bash shell configuration
├── .zshrc                         # Zsh shell configuration (primary shell)
├── .gitconfig                     # Global Git identity and settings
├── .gitignore                     # Global Git ignore rules
└── .config/
    ├── alacritty/                 # Alacritty terminal emulator config + themes
    ├── bat/                       # bat (cat replacement) config and themes
    ├── btop/                      # btop system monitor config and themes
    ├── cava/                      # cava audio visualiser config and shaders
    ├── cursor/                    # Cursor editor settings and keybindings
    ├── docs/                      # Documentation for this repository
    ├── eza/                       # eza (ls replacement) theme
    ├── fastfetch/                 # fastfetch system info config
    ├── fzf/                       # fzf fuzzy finder shell integration
    ├── git/                       # Per-directory .gitconfig (XDG location)
    ├── github-copilot/            # GitHub Copilot version state
    ├── homebrew/                  # installed_brew.conf: list of installed formulae
    ├── jabref/                    # JabRef reference manager theme
    ├── kitty/                     # Kitty terminal emulator config and themes
    ├── lazygit/                   # Lazygit TUI Git client config
    ├── linearmouse/               # LinearMouse pointer customisation
    ├── nnn/                       # nnn file manager plugins
    ├── nvim/                      # Neovim config (LazyVim-based)
    ├── profile/                   # Profile photo asset
    ├── raycast/                   # Raycast launcher extensions
    ├── starship.toml              # Starship cross-shell prompt config
    ├── texstudio/                 # TeXstudio editor config and completions
    ├── vscode/                    # VS Code settings, keybindings, extensions list
    ├── wallpaper                  # Wallpaper image
    ├── warp/                      # Warp terminal themes and preferences
    ├── yadm/
    │   └── update-dotfiles.sh     # Active sync script (canonical location)
    ├── zathura/                   # Zathura PDF viewer config
    ├── zellij/                    # Zellij terminal multiplexer config
    └── zsh/
        └── .zshrc                 # Zsh config (XDG-compliant location)
```

---

### The Sync Script: `update-dotfiles.sh`

**Canonical path:** `~/.config/yadm/update-dotfiles.sh`

The script automates the full pull → stage → commit → push cycle for YADM.

It is intended to be run manually whenever `.config` changes should be

committed and pushed.

#### Default Behaviour

When called with no arguments, the script:

1. Pulls the latest remote changes using `yadm pull --rebase --autostash`.
2. Displays the current `yadm status`.
3. Stages all changes under `.config` using `yadm add --all.config`.
4. Commits with an auto-generated timestamp message:
   `tldr: sync dotfiles (YYYY-MM-DDTHH:MMZ)`
5. Pushes to `origin main`.

#### Usage

```sh
# Default: pull, stage, commit, push
bash ~/.config/yadm/update-dotfiles.sh

# Custom commit message
bash ~/.config/yadm/update-dotfiles.sh "tweak kitty theme"

# Show status only, no changes
bash ~/.config/yadm/update-dotfiles.sh --status

# Pull only, skip commit and push
bash ~/.config/yadm/update-dotfiles.sh --pull-only

# Stage and commit but do not push
bash ~/.config/yadm/update-dotfiles.sh --no-push

# Preview commands without executing mutating steps
bash ~/.config/yadm/update-dotfiles.sh --dry-run
```

#### All Options

| Flag | Description |
|---|---|
| `-h`, `--help` | Show help text |
| `-s`, `--status` | Show status and exit |
| `-P`, `--pull-only` | Pull with rebase then exit |
| `-n`, `--no-push` | Skip the push step |
| `-b`, `--branch <name>` | Target branch for push (default: `main`) |
| `-m`, `--message <msg>` | Explicit commit message |
| `-q`, `--quiet` | Suppress informational output |
| `--dry-run` | Print commands without running mutating steps |
| `--no-status` | Skip the pre-commit status display |

#### Environment Variable

The default push branch can be overridden without touching the script:

```sh
YADM_SYNC_BRANCH=feature-branch bash ~/.config/yadm/update-dotfiles.sh
```

---

### Important Notes

- The script stages **only files under `.config`**. Root-level dotfiles
  (`.zshrc`, `.bashrc`, `.gitconfig`, `.gitignore`) must be staged manually
  with `yadm add` when changed.
- The remote is `https://github.com/agni-datta/csDots.git`, branch `main`.
- Neovim configuration at `~/.config/nvim` is tracked as individual files,
  not as a submodule.
