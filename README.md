# Pix3lexe dotfiles

Welcome to my dotfiles repository! This repository contains the configuration files (dotfiles) I use to set up and customize my development environment. These dotfiles are modular and managed using **GNU Stow** for efficient deployment.

---

## 📋 **Table of Contents**
- [Overview](#overview)
- [Features](#features)
- [Installation](#installation)
- [Structure](#structure)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

---

## 🛠️ **Overview**
Dotfiles are configuration files for various programs and tools, often starting with a dot (`.`). This repository:
- Provides a backup of my preferred environment setup.
- Allows quick deployment across systems.
- Uses **GNU Stow** for modularity and ease of management.

---

## ✨ **Features**
- Configurations for tools like:
  - **Neovim** (`nvim`)
  - **Zsh** (`zsh`)
  - **Git** (`git`)
  - **Tmux** (`tmux`)
  - **Kitty** (terminal emulator)
- Designed for Linux-based systems (tested on Arch Linux).
- Compatible with **GNU Stow** for simple symlink creation.
- Easily customizable and extendable.

---

## 🖥️ **Installation**

### **Prerequisites**
1. Install GNU Stow:
   ```bash
   sudo pacman -S stow  # For Arch-based systems
   ```
   Alternatively, use your package manager (`apt`, `brew`, etc.) if you're not on Arch.
   
2. Clone this repository to your home directory or any preferred location:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

---

## 📁 **Structure**
The repository is structured to be modular, with each folder representing a specific tool or program.

```
dotfiles/
├── nvim/            # Configuration for Neovim
│   └── .config/nvim/
├── zsh/             # Zsh shell configuration
│   └── .zshrc
├── tmux/            # Tmux configuration
│   └── .tmux.conf
├── git/             # Git configuration
│   └── .gitconfig
└── ...
```

Each directory contains the relevant files, arranged in the same structure as their destination.

---

## 🚀 **Usage**

### Deploy Configurations
Use **GNU Stow** to symlink configuration files to their respective locations.

1. Navigate to the `dotfiles` directory:
   ```bash
   cd ~/dotfiles
   ```

2. Stow a specific configuration (e.g., Neovim):
   ```bash
   stow -t ~ nvim
   ```
   This creates the necessary symlinks, such as:
   ```
   ~/.config/nvim -> ~/dotfiles/nvim/.config/nvim
   ```

3. Stow all configurations:
   ```bash
   stow -t ~ */
   ```

### Unstow Configurations
To remove the symlinks created by Stow:
```bash
stow -D -t ~ nvim
```

### Setup Script
Alternatively you can run the setup script (only works on Arch), which will set up everything by itself:
```bash
./setup.sh
```

---

## 📜 **License**
This repository is licensed under the [MIT License](https://opensource.org/licenses/MIT). Feel free to use, modify, and share these dotfiles.

---

## ✉️ **Contact**
If you have questions or suggestions, feel free to reach out via GitHub Issues.
