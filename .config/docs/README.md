---
title: README
linter-yaml-title-alias: README
date created: Wednesday, October 8th 2025, 11:43:21 pm
date modified: Friday, March 6th 2026, 9:39:46 pm
aliases: README
---

<!-- @format -->

```table-of-contents
title:
style: nestedList # TOC style (nestedList|nestedOrderedList|inlineFirstLevel)
minLevel: 0 # Include headings from the specified level
maxLevel: 0 # Include headings up to the specified level
include:
exclude:
includeLinks: true # Make headings clickable
hideWhenEmpty: false # Hide TOC if no headings are found
debugInConsole: false # Print debug info in Obsidian console
```

## csMacDots

### TL;DR

- Single source of truth for my macOS dotfiles, managed with `yadm` and stored in `https://github.com/agni-datta/csMacDots.git`.
- Track only what I care about: configs live under `.config`, supporting assets ride alongside.
- Keep restores painless, clone with `yadm`, resolve diffs fast, stay confident about the state of the machine.

### Philosophy

- **Stay deliberate.** Every tracked file should have a purpose; unneeded defaults stay out of version control.
- **Keep $HOME tidy.** Everything lands under `.config/` (docs included) so the root remains clutter-free.
- **Prefer transparency over magic.** No bootstrap script that hides work, `yadm` commands tell the full story.
- **Optimize for fast recovery.** A clean clone followed by `yadm checkout` must reproduce a working environment.

### Daily Workflow

1. Make changes locally.
2. `yadm status` to review the delta.
3. `yadm add <paths>` and `yadm commit -m "Meaningful message"`.
4. `yadm push origin main` (remote is `https://github.com/agni-datta/csMacDots.git`).

### Bootstrap

```bash
# One-time setup on a new machine
brew install yadm
yadm clone https://github.com/agni-datta/csMacDots.git
# Review conflicts before checking out over existing files
yadm status
```

### Layout Cheat Sheet

```
.config/
├── alacritty/                 # Alacritty terminal emulator config + themes
├── antigravity/               # Antigravity assistant config
├── bat/                       # bat (cat replacement) config and themes
├── btop/                      # btop system monitor config and themes
├── cava/                      # cava audio visualiser config and shaders
├── cursor/                    # Cursor editor settings and keybindings
├── devin/                     # Devin AI assistant config
├── docs/                      # Documentation for this repository
├── eza/                       # eza (ls replacement) theme
├── fastfetch/                 # fastfetch system info config
├── fzf/                       # fzf fuzzy finder shell integration
├── gh/                        # GitHub CLI config
├── git/                       # Per-directory .gitconfig (XDG location)
├── homebrew/                  # installed_brew.conf: list of installed formulae
├── jabref/                    # JabRef reference manager theme
├── kitty/                     # Kitty terminal emulator config and themes
├── lazygit/                   # Lazygit TUI Git client config
├── linearmouse/               # LinearMouse pointer customisation
├── nnn/                       # nnn file manager plugins
├── nvim/                      # Neovim config (LazyVim-based)
├── opencode/                  # Opencode config
├── profile/                   # Profile photo asset
├── raycast/                   # Raycast launcher extensions
├── starship/                  # Starship config directory
├── starship.toml              # Starship cross-shell prompt config
├── update-dotfiles.sh         # Active sync script
├── vscode/                    # VS Code settings, keybindings, extensions list
├── yadm/                      # yadm config
├── zathura/                   # Zathura PDF viewer config
├── zellij/                    # Zellij terminal multiplexer config
└── zsh/                       # Zsh config (XDG-compliant location)
```

### Safety Notes

- Keep an eye on large binaries (e.g., wallpapers). If size becomes an issue, move them to a separate storage.
- For risky experiments, use feature branches directly in the yadm repo before merging back to `main`.

### Attribution

- Themes and presets draw on Nord, LazyVim, and the wider dotfiles community. See individual files for upstream licenses where applicable.
