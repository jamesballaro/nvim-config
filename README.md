Simple neovim config

This repository contains my personal Neovim configuration (which lets me setup on new devices easily)

Bootstrap (example)

macOS (Homebrew):

```bash
# Install Homebrew (if you don't have it)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install neovim git python cmake ninja
```

Ubuntu/Debian:

```bash
sudo apt update
sudo apt install -y neovim git python3 python3-pip build-essential cmake ninja-build
```

Usage

1. Clone this repo into `~/.config/nvim`:

```bash
git clone <repo-url> ~/.config/nvim
```

2. Start Neovim. The config bootstraps itself (lazy.nvim will be cloned if missing). Open `:Lazy` to view/manage plugins and `:Mason` to install language servers.
