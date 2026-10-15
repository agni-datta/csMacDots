---
title: README
aliases: [README, 'README, "csMacDots"']
linter-yaml-title-alias: README
date created: Tuesday, July 21st 2026, 12:10:35 am
date modified: Wednesday, October 14th 2026, 3:25:59 am
---

<!-- @format -->

## csMacDots

Agni Datta’s macOS shell and application configuration. It is arranged for management with [yadm](https://yadm.io/) and includes XDG configuration under `.config/` together with selected home-directory dotfiles.

### Status

The files encode a personal workstation configuration. Review every path, Homebrew assumption, and command before applying the repository to another account or host.

### Installation

Install `yadm`, inspect the tracked configuration, and use yadm’s normal clone or bootstrap workflow only after backing up existing files. The repository does not provide an unattended installer.

### Maintenance Commands

The following commands are safe inspection paths.

```bash
bash -n .config/symlink-dotfiles.sh
bash -n .config/update-dotfiles.sh
.config/update-dotfiles.sh --help
```

The symlink and update scripts can move files, stage changes, commit, or push. Read them before running any mutating path.

### AI Configuration Backups

yadm manages only `.claude/CLAUDE.md`, `.claude/settings.json`, `.codex/AGENTS.md`, `.codex/config.toml`, and `.codex-switcher/settings.json`. The ignore rules exclude the remaining contents of those folders.

The exact paths in `.config/yadm/encrypt` select `.codex/auth.json` and `.codex-switcher/accounts.json` for GPG encryption. Their local copies remain available to the applications. The encrypted archive is `.local/share/yadm/archive`; its recipient is the existing GPG key configured in `.config/yadm/config`. Keep the matching private key available separately for recovery.

After authentication changes, refresh the encrypted backup:

```sh
yadm encrypt
```

Inspect an archive's file list with `yadm decrypt -l`. On a replacement machine, import the matching GPG private key before using `yadm decrypt` to restore credentials; decryption writes the archived files into the home directory. Refreshing the archive does not commit or push it.

### License

No separate license is provided; applicable law reserves all otherwise ungranted rights.
