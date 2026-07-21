---
title: "csMacDots"
aliases: "csMacDots"
linter-yaml-title-alias: "csMacDots"
date created: Wednesday, October 8th 2025, 11:43:21 pm
date modified: 2026-07-21
---

<!-- @format -->

# csMacDots

## TL;DR

- `yadm` manages the macOS dotfiles in this repository.
- Application configuration lives primarily below `.config/`.
- Review conflicts and create a recoverable backup before checkout on a new Mac.

## Philosophy

- Track only deliberate configuration and required supporting assets.
- Prefer XDG-compatible locations when applications support them.
- Keep restore operations observable through normal `yadm` commands.
- Exclude credentials, caches, and machine-specific state.

## Daily Workflow

1. Edit the local configuration.
2. Review with `yadm status` and `yadm diff`.
3. Stage explicit paths and commit a descriptive message.
4. Push only after checking the staged diff for private data.

## Bootstrap

```bash
brew install yadm
yadm clone https://github.com/agni-datta/csMacDots.git
yadm status
```

Resolve checkout conflicts one path at a time rather than replacing the current home configuration wholesale.

## Layout Cheat Sheet

```text
.config/
├── alacritty/ kitty/      terminal configuration
├── antigravity/ cursor/   editor configuration
├── bat/ btop/ eza/        command-line themes
├── cava/ fastfetch/       visualization and system information
├── fzf/ git/ gh/          shell and version-control tools
├── homebrew/              recorded Homebrew inventory
├── nnn/ yazi/             file managers and plugins
├── nvim/                  LazyVim-based Neovim configuration
├── raycast/ linearmouse/  desktop utilities
├── vscode/                VS Code settings and extensions
├── yadm/                  yadm configuration
├── zathura/ zellij/ zsh/  PDF viewer, multiplexer, and shell
└── update-dotfiles.sh
```

## Safety Notes

- Inspect large binaries before adding them; keep unrelated assets in dedicated storage.
- Read `update-dotfiles.sh` before allowing it to stage, commit, or push changes.
- Use a branch for experimental configuration and verify symlink destinations.
- Never commit tokens, private keys, cookies, or application session databases.

## Attribution

Themes and presets draw from Nord, LazyVim, and other upstream projects. Individual files retain the applicable upstream notices.
