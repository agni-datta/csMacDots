---
title: README
linter-yaml-title-alias: README
date created: Wednesday, October 8th 2025, 11:43:21 pm
date modified: Friday, March 6th 2026, 9:39:46 pm
aliases: README
---

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

## csDots

### TL;DR

- Single source of truth for my macOS dotfiles, managed with `yadm` and stored in `/Users/agnidatta/Drive/repositories/csDots`.
- Track only what I care about: configs live under `.config`, supporting assets ride alongside.
- Keep restores painless—clone with `yadm`, resolve diffs fast, stay confident about the state of the machine.

### Philosophy

- **Stay deliberate.** Every tracked file should have a purpose; unneeded defaults stay out of version control.
- **Keep $HOME tidy.** Everything lands under `.config/` (docs included) so the root remains clutter-free.
- **Prefer transparency over magic.** No bootstrap script that hides work—`yadm` commands tell the full story.
- **Optimize for fast recovery.** A clean clone followed by `yadm checkout` must reproduce a working environment.

### Daily Workflow

1. Make changes locally.
2. `yadm status` to review the delta.
3. `yadm add <paths>` and `yadm commit -m "Meaningful message"`.
4. `yadm push origin main` (remote is the local repo in `Drive/repositories/csDots`, mirror or sync elsewhere as needed).

### Bootstrap

```bash
# One-time setup on a new machine
brew install yadm
yadm clone /Users/agnidatta/Drive/repositories/csDots
# Review conflicts before checking out over existing files
yadm status
```

### Layout Cheat Sheet

```
.config/
  bat/                # bat themes + config
  btop/               # btop presets and Catppuccin theme
  kitty/              # kitty base config plus Catppuccin variants
  nvim/               # LazyVim-based Neovim setup
  raycast/            # Shipping Raycast extensions and assets
  wallpaper/          # Curated wallpaper set + rename helper
  zsh/.zshrc          # Shell entry point (loads plugins, prompts, etc.)
  csDots/README.md    # This file, kept out of $HOME root
```

### Safety Notes

- Keep an eye on large binaries (e.g., wallpapers). If size becomes an issue, move them to a separate storage.
- For risky experiments, use feature branches directly in the yadm repo before merging back to `main`.

### Attribution

- Themes and presets draw on Catppuccin, LazyVim, and the wider dotfiles community. See individual files for upstream licenses where applicable.
