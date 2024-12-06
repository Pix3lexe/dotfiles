# Pix3lexe dotfiles

Welcome to my dotfiles repository! This repository contains the configuration files (dotfiles) I use to set up and customize my development environment. These dotfiles are modular and managed using **GNU Stow** for easy deployment.

---

## 📋 **Table of Contents**
- [Overview](#overview)
- [Features](#features)
- [Installation](#installation)
- [Structure](#structure)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [Contact](#contact)

---

## 🛠️ **Overview** <a name="overview"></a>
Dotfiles are configuration files for various programs and tools, often starting with a dot (`.`). This repository:
- Provides a backup of my preferred environment setup.
- Allows quick deployment across systems.
- Uses **GNU Stow**.

---

## ✨ **Features** <a name="features"></a>
- Configurations for tools like:
  - **Neovim** (`nvim`)
  - **Zsh** (`zsh`)
  - **Tmux** (`tmux`)
  - **Yazi** (`yazi`)
  - **Kitty** (terminal emulator)
- Designed for Linux-based systems (tested on Arch Linux).
- Compatible with **GNU Stow** for simple symlink creation.
- Easily customizable and extendable.

---

## 🖥️ **Installation** <a name="installation"></a>

### **Prerequisites**
1. Install GNU Stow:
   ```bash
   sudo pacman -S stow  # For Arch-based systems
   ```
   Alternatively, use your package manager (`apt`, `brew`, etc.) if you're not on Arch.
   
2. Clone this repository to your home directory or any preferred location:
   ```bash
   git clone https://github.com/Pix3lexe/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

### 🛠️ **Hyprland Dependencies**

Before using these dotfiles, make sure the following dependencies are installed (these are specific to the Hyprland-based environment and related tools).<br>
NOTE: If you're on Arch you can also install them by running:
```bash
./install.sh
```

- **hyprland**: Window manager for Wayland.
- **wofi**: Application launcher.
- **waybar**: Status bar for Wayland.
- **ttf-font-awesome**: Icon font for status bars and UI customization.
- **hyprshot**: Screenshot tool for Hyprland.
- **swaync**: Notification daemon.
- **hyprlock**: Screen locker for Hyprland.
- **hypridle**: Idle management tool.
- **hyprpaper**: Wallpaper manager for Hyprland.
- **nwg-look**: GTK theme switcher for Wayland.
- **xdg-desktop-portal-gtk**: Desktop portal for GTK integration.
- **xdg-desktop-portal-hyprland**: Desktop portal specific to Hyprland.
- **catppuccin-gtk-theme-mocha**: GTK theme for a consistent aesthetic.
- **wl-clipboard**: Clipboard manager for Wayland.
---

## 📁 **Structure** <a name="structure"></a>
The repository is structured to be modular, with each folder representing a specific tool or program.

```
dotfiles/
├── nvim/            # Configuration for Neovim
│   └── .config/nvim/
├── zsh/             # Zsh shell configuration
│   └── .zshrc
├── tmux/            # Tmux configuration
│   └── .tmux.conf
└── ...
```

Each directory contains the relevant files, arranged in the same structure as their destination.

---

## 🚀 **Usage** <a name="usage"></a>

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

## 📸 **Screenshots** <a name="screenshots"></a>
- **Terminal**
![image](https://github.com/user-attachments/assets/811c37d3-742d-44e2-9638-b81f4752aa8b)

- **Neovim**
![image](https://github.com/user-attachments/assets/4ad776dd-b174-4e01-910f-b571141b38db)

- **Desktop and Wofi**
![image](https://github.com/user-attachments/assets/157aad80-2b0c-4c0e-94df-9c4d263fe1d3)


---

## ✉️ **Contact** <a name="contact"></a>
If you have questions or suggestions, feel free to reach out via GitHub Issues.
