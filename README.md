<h1 align=center>Pix3lexe dotfiles</h1>

<div align=center>

![GitHub last commit](https://img.shields.io/github/last-commit/Pix3lexe/dotfiles?style=for-the-badge&labelColor=101418&color=9ccbfb)
![GitHub Repo stars](https://img.shields.io/github/stars/Pix3lexe/dotfiles?style=for-the-badge&labelColor=101418&color=b9c8da)
![GitHub repo size](https://img.shields.io/github/repo-size/Pix3lexe/dotfiles?style=for-the-badge&labelColor=101418&color=d3bfe6)

</div>

Welcome to my dotfiles repository! The setup script is designed for arch but everything can be installed on basically every linux distro if you do it manually. Have fun ^^

---

## <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 640"><!--!Font Awesome Free v7.2.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2026 Fonticons, Inc.--><path d="M480 96C515.3 96 544 124.7 544 160L544 480C544 515.3 515.3 544 480 544L160 544L153.5 543.7C121.2 540.4 96 513.1 96 480L96 160C96 124.7 124.7 96 160 96L480 96zM160 384L160 480L288 480L288 384L160 384zM352 384L352 480L480 480L480 384L352 384zM160 320L288 320L288 224L160 224L160 320zM352 320L480 320L480 224L352 224L352 320z"/></svg> **Table of Contents**

- [Overview](#overview)
- [Features](#features)
- [Installation](#installation)
- [Structure](#structure)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [Contact](#contact)

---

##  **Overview** <a name="overview"></a>

Dotfiles are configuration files for various programs and tools, often starting with a dot (`.`). This repository:

- Provides a backup of my preferred environment setup.
- Designed for Linux-based systems (tested on Arch Linux).
- Allows quick deployment across systems.
- Uses **GNU Stow**.
- Uses matugen for materialized colors.

---

##  **Features** <a name="features"></a>

- Configurations for tools like:
  - **Neovim** (`nvim`)
  - **Zsh** (`zsh`)
  - **Tmux** (`tmux`)
  - **Yazi** (`yazi`)
  - **Kitty** (terminal emulator)
- Easily customizable and extendable.

---

##  **Installation** <a name="installation"></a>

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

###  **Hyprland Dependencies**

Before using these dotfiles, make sure the following dependencies are installed if you're using Hyprland (these are specific to the Hyprland-based environment and related tools) or just run the [setup script](#installation).<br>

- **hyprland**: Window manager for Wayland.
- **wofi**: Application launcher.
- **waybar**: Status bar for Wayland.
- **matugen**: Materialized colors based on wallpaper.
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

##  **Structure** <a name="structure"></a>

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

##  **Usage** <a name="usage"></a>

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

##  **Screenshots** <a name="screenshots"></a>

- **Terminal**
  ![image](https://github.com/user-attachments/assets/97dacc7f-48ee-4661-ae6e-dcfafa3c9dc9)

- **Neovim**
  ![image](https://github.com/user-attachments/assets/2bde98b8-966d-4b7c-b1fb-b62583892ffd)
  ![image](https://github.com/user-attachments/assets/97e603fc-74a4-4723-85d8-ff04d20de090)

- **Desktop**
  ![image](https://github.com/user-attachments/assets/377d8e8b-3112-4dba-8074-401501bdd2b8)

- **Lockscreen**
  ![image](https://github.com/user-attachments/assets/64ade365-a9b4-4ea6-be60-b2b4c5c61810)

- **Wallpaper and flavor switcher**
  ![image](https://github.com/user-attachments/assets/ee1ca094-75fd-4f15-979c-21d8e2d671fc)
  ![image](https://github.com/user-attachments/assets/7558fb3b-bfab-468c-a11b-065443cab156)
  ([Chainsaw Man wallpaper used](https://wallpapercave.com/w/wp15865971))

---

##  **Contact** <a name="contact"></a>

If you have questions or suggestions, feel free to reach out via GitHub Issues.
