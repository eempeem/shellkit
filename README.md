# ShellKit

A modular zsh setup for a fast, reusable terminal with aliases, prompt themes, plugin bootstrapping, and app integrations.

## Install

Clone the project and source it from your zsh configuration:

```bash
git clone https://github.com/eempeem/shellkit.git ~/.shellkit
```

Then add this to your `~/.zshrc`:

```bash
source ~/.shellkit/init.zsh
```

Restart your terminal or run:

```bash
source ~/.zshrc
```

## Features

- Reusable shell aliases
- Prompt customization
- Plugin bootstrapping for zsh
- App-specific environment setup
- Easy enable/disable of integrations

## Customize

You can add or change your aliases and shell behavior by editing the config files in the project.

Enable selected app configs:

```bash
APP_ENABLE=(git docker golang ghostty)
```

Disable a specific app:

```bash
APP_DISABLE=(docker)
```

Or enable everything:

```bash
APP_ENABLE=('*')
```

## Aliases and functions

The general aliases are loaded whenever ShellKit is sourced. Git and Docker
aliases are loaded only when their app configs are enabled with `APP_ENABLE`.

### Aliases

| Alias | Expansion | Config |
| --- | --- | --- |
| `l` | `ls` | General |
| `ll` | `ls -lh` | General |
| `la` | `ls -a` | General |
| `lla` | `ls -lha` | General |
| `dockerps` | `docker ps` with ID, name, image, and command columns | Docker |
| `gac` | `git add . && git commit -m` | Git |
| `gb` | `git branch` | Git |
| `gl` | `git log --oneline` | Git |
| `glf` | `git log` | Git |
| `gs` | `git switch` | Git |
| `gsh` | `git show` | Git |
| `gsl` | `git stash list` | Git |
| `gcp` | `git cherry-pick` | Git |
| `gc` | `git commit -m` | Git |
| `s` | `git status` | Git |

### Helpers

#### Filesystem

| Usage | Description |
| --- | --- |
| `fs-ls <directory> <pattern>` | Finds matching files and directories under a directory. |
| `fs-rm [--skip-ls] <directory> <pattern>` | Previews matching items, then asks for confirmation before deleting them. `--skip-ls` skips the preview. |

#### Disk usage

| Usage | Description |
| --- | --- |
| `du-free` | Shows free disk space for `/`. |
| `du-usage [directory] [depth]` | Sorts disk usage by size; defaults to `.` and depth `1`. |
| `du-size [directory] [size]` | Lists files larger than the given size; defaults to `.` and `500M`. |
| `du-docker` | Shows Docker disk usage with `docker system df`. |
| `du-brew` | Shows the size of the Homebrew cache. |
| `du-tm-snapshots` | Lists local Time Machine snapshots. |

## Notes

This project is designed to keep your terminal setup clean, reusable, and easy to extend as your toolchain grows.
