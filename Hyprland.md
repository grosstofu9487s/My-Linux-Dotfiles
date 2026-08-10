## 1. Install Hyprland
I recommand this tutorial for installing Hyprland on Fedora, note that there are some known Qt issues on the copr source from **solopasha/hyprland**, so I highly suggest to use **lionheartp/Hyprland** instead. (well maybe it'll be fixed in the future)

*I used power-profiles-daemon instead of tuned, so you'll have to take a look at the packages you'll have to install below before you go through the step 4 of the Hyprland installation, to make sure you won't install the packages you don't need.*

https://discussion.fedoraproject.org/t/tutorial-fedora-43-install-hyprland-from-scratch/168386

---
## 2. Install Required Packages
>Hyprland is not meant to be a full and user-friendly Desktop Environment. In a nutshell, it’s a set of tools to allow you to create your own Desktop Environment.   - Hyprland Wiki

So we'll have to install some packages that'll make system works, also make this dotfile know where it will be located, note that some packages will require you to build it from scratch.
### - packages you can install from dnf
```bash
sudo dnf install git ImageMagick kitty ranger power-profiles-daemon waybar rofi imv vlc fastfetch wlogout cava
# feel free to add or remove packages, the packages listed here is only for making this dotfile work
```

### - packages you have to build it from source
**awww - https://codeberg.org/LGFae/awww**
</br>

make sure to reboot after this.

---
## 3. Install Mouse Cursor
I used Bibata Ice cursor for this dotfile, this isn't means that you can only use this as your cursor, but if you want to change make sure to modify the hyprland config to make it work, the default config in this dotfile uses Bibata Ice.

https://github.com/ful1e5/Bibata_Cursor

---
## 4. Copy Dotfiles
Now is the interesting part, you can do this in Hyprland session or just in tty. 