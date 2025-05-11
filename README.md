# Pix3lexe dotfiles

Welcome to my legendary dotfiles repository! The setup script is designed for arch but everything can be installed on basically every linux distro if you do it manually. Have fun ^^

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
- Designed for Linux-based systems (tested on Arch Linux).
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
- Easily customizable and extendable.

---

## 🖥️ **Installation** <a name="installation"></a>

### **Prerequisites**

1. Clone this repository to your home directory or any preferred location:
   ```bash
   git clone https://github.com/Pix3lexe/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```
2. Run setup script to install everything and deploy configurations:
   ```bash
   ./setup.sh
   ```
   - **✏️Note**: If you only want to have a specific config look up [Usage](#usage)
   - **⚠️Warning**: This script does not guarantee that every optional dependency is installed (eg. a latex compiler so that vimtex works). Install them by yourself if you need them.

### 🛠️ **Hyprland Dependencies**

Before using these dotfiles, make sure the following dependencies are installed if you're using Hyprland (these are specific to the Hyprland-based environment and related tools) or just run the [setup script](#installation).<br>

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

### Apply Specific Configurations

To only stow (deploy) a specific configuration (eg. nvim):

```bash
stow -t ~ nvim
```

### Remove Specific Configurations

To remove a symlink created by Stow (eg. nvim):

```bash
stow -D -t ~ nvim
```

---

## 📸 **Screenshots** <a name="screenshots"></a>

- **Terminal**
  ![image](https://github.com/user-attachments/assets/65dcd04e-35eb-4f9e-9f2c-d2994643eec4)

- **Neovim**
  ![image](https://github.com/user-attachments/assets/2bde98b8-966d-4b7c-b1fb-b62583892ffd)
  ![image](https://github.com/user-attachments/assets/83cd8055-9bfa-49b4-bab6-9ac464c8e751)

- **Desktop and Wofi**
  ![image](https://github.com/user-attachments/assets/89614b6b-bd41-4091-904b-d297b866ef58)

- **Custom wallpaper and flavor switcher**
  ![image](https://github.com/user-attachments/assets/6258d85b-1960-4a01-a61b-d86ba2240a2f)
  ![image](https://github.com/user-attachments/assets/bd81cc16-716a-4ab7-b231-015ee3165b94)



---

## ✉️ **Contact** <a name="contact"></a>

If you have questions or suggestions, feel free to reach out via GitHub Issues.
