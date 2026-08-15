## 1. Install KDE Plasma
bruh c'mon you know how to do this.

---

## 2. Clone this repo
```bash
git clone https://github.com/grosstofu9487s/My-Linux-Dotfiles.git
```
now you will get a folder named **My-Linux_Dotfiles** with all the dotfiles in it.

---
## 3. Install Icons
Now we're in the folder, You can install the **monochrome-statusonly** icons pack by simply drag and drop **monochrome-statusonly.tar.gz** into the system setting page. Remeber to apply the settings. </br></br>
*This icons pack is a modified version of ****Yet Another Monochrome Icon****, means that I didn't make these icons at all, what I did is use only the system trays icons and keep the folder and apps icons of Breeze. If you're interested in the original icons pack here is the link: [Yet Another Monochrome Icon](https://store.kde.org/p/2303161)* 

---
## 4. Install psudo Font
You can skip this step if you already have a font you preferred, I used **psudoFont Liga Mono** for this dotfile, if you want to use it too you can install it by
```bash
git clone https://github.com/psudo-dev/psudofont-liga-mono.git
cp -r "psudofont-liga-mono/psudoFont Liga Mono" ~/.local/share/fonts/
fc-cache -v
```
and apply it in the system settings page.

---
## 5. Install Konsave and Apply Layout
You can skip this step if you already made a desktop layout, keep going if you want to use mine. I usually use [Konsave](https://github.com/Prayag2/konsave) to backup my desktop layout and color themes, you can install it by using pip
```bash
python -m pip install konsave # oh yeah remember to install python btw
```

I used [yoelwep13578's Resource-Viewer-Plasma-Widget](https://github.com/yoelwep13578/Resource-Viewer-Plasma-Widget/) in my plasma panel, so to make the panel work you will also have to move the **.panel_scripts** folder in your home dictionary, for more informations about it please check the github page.

Before we apply the theme, we'll have to extract the layout file which named **Tofu-kde-layout.7z**, then you'll get a file named **Tofu-kde-layout.knsv**, and now you can manually apply it by
```bash
konsave -i <path to Tofu-kde-layout.knsv>
konsave -a "Tofu-kde-layout"
```
*You might be wondering why I didn't just upload the knsv file, actually github has a limitation for file size with 50MB, and my knsv file's size is way bigger then 50MB, so yeah I have no choice but put it in a zip*

---
## 6. Install Colors
This step is for the color theme that matchs the wallpaper, you can just pick a color theme and wallpaper you like and apply it, or you can install them all and use my theme-switcher script to swtich between them.</br>
The color themes location is in **~/.local/share/color-schemes**, put the files in **KDE-colors** into here to use it as your color theme.

---
## 7. Install Packages and theme switcher
Like I mentioned in step 5, you can install all color themes and use themes-switcher to swich between them. The themes-switcher can not only change the kde color-schemes but change program's color theme include rofi, wlogout, kitty, so I recommand you also install these packages to have the full experience of the themes-switcher.
```bash
sudo dnf install wlogout kitty rofi
#fedora btw, if you use other distro remember to change the package manager to your distro's
```
Well it doesn't means that you must use these programs, but if you didn't install these make sure to modify the switcher's script to make it work, for example you didn't install rofi, then remove the command that changes rofi's color theme. (Don't worry, I have already do the comment for the commands, but the themes-swticher itself is work on rofi so you must install rofi if you want to use the theme switcher.)

And remember to use the config file in the **kde_plasma/.config** folder if you installed the packages, using them by simply copy all the folder in **kde_plasma/.config** into **~/.config**.

*I use rofi instead of krunner just because krunner is a bit slow for me, so if you want to use rofi to replace krunner you can unbind the shortcut for krunner and bind them to command ```rofi -show drun``` or ```rofi -show drun -show-icons``` for the app runner with icons*
</br></br>
*if you want to use wlogout, make sure to modify the wlogout's style.css file (~/.config/wlogout/style.css), edit it by change all the **USER** to your user name. alright if you're too lazy to do it here is the one-line command ```sed -i "s/\/home\/USER\//\/home\/$USER\//g" <path-yo-your-wlogout-style.css>```*

---
## 8. Keybinds
This step is only for the themes-switcher, I recommend bind **super + space** for the themes-switcher script, and also remember to put **theme-switcher-kde.sh** (main script), **theme-colour.json** (all the theme colors), **colour.css** (for wlogout) and folder **wallpaper** (yes) in your **$HOME** path to make it work. otherwise you can edit the script to match the path you want.

---
## 9. fastfetch
If you have done the step 7 you'll notice that there's a **fastfetch** folder in the config folder, it's because I also have a fastfetch custom theme, if you want to use that also remember to copy that, and also put **Still_Still_Stellar.png** in your $HOME path for the custom fastfetch logo.

---
It isn't that hard to customize your kde plasma, you can follow all these steps, or you can just git clone my dotfiles and do what you want.