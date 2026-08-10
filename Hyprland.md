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
Now is the interesting part, you can do this in Hyprland session or just in tty. first, clone this repository and cd into it
```bash
git clone https://github.com/grosstofu9487s/My-Linux-Dotfiles.git
cd My-Linux-Dotfiles
```

and move the theme color data and wallpaper into your *home* dictionary
```bash
mv theme_colour.json ~
mv wallpaper ~
```

Since we're on Hyprland, we'll have to copy the Hyprland dotfiles into your *.config* folder, luckily, I already made a little bash file to do it for you, so what you need to do is just cd into *hyprland* and run it.
```bash
cd hyprland
bash setup.sh #note that this script will also install psudoFont Liga Mono, which I used in this rice
```

I recommend reboot once after all, and you're good to go ;>

---

## 5. Keybinds
I have modified the default Hyprland keybinds, if you got your own then make sure you have edited the **hyprland.lua**, and if you didn't and you want to give my keybinds a try then check the charts below:

| if you pressed | Hyprland will              |
|----------------|----------------------------|
| alt + space    | open app launcher (rofi)   |
| ctrl + space   | open logout menu (wlogout) |

| if you pressed *MainMod with | Hyprland will                                                           |
|---------------------------|-------------------------------------------------------------------------|
| Q                         | open terminal (kitty)                                                   |
| E                         | open file manager (ranger)                                              |
| W                         | close current window                                                    |
| F                         | float current window                                                    |
| D                         | split current layout (hard to explain you can just try it)              |
| space                     | open theme switcher                                                     |
| h                         | focus window on the left                                                |
| l                         | focus window on the right                                               |
| k                         | focus window on the up                                                  |
| j                         | focus window on the down                                                |
| arrow key left            | move to previous workspace                                              |
| arrow key right           | move to next workspace                                                  |
| numbers                   | move to the workspace depend on what number you pressed                 |
| numbers + shift           | move current windows to the workspace depend on what number you pressed |
| left mouse button         | move current window                                                     |
| right mouse button        | resize current window                                                   |

*MainMod: Super key (windows key)
