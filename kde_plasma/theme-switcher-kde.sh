#!/usr/bin/env bash
WallpaperPath=~/wallpaper
SelectedTheme=$(ls "$WallpaperPath" | rofi -dmenu -p)

if [ -f "$WallpaperPath/$SelectedTheme" ]; then	
	echo "Current selected wallpaper: $WallpaperPath/$SelectedTheme"

	AccentColor=$(jq '."'"$SelectedTheme"'"."accent-color"' theme_colour.json --raw-output)
	BackgroundColor=$(jq '."'"$SelectedTheme"'"."background-color"' theme_colour.json --raw-output)
    TextColor=$(jq '."'"$SelectedTheme"'"."text-color"' theme_colour.json --raw-output)

	KDEColors=$(jq '."'"$SelectedTheme"'"."KDE-colors"' theme_colour.json --raw-output)

	sed -i -e 's/bg0:.*/bg0: '$BackgroundColor'F2;/' -e 's/bg1:.*/bg1: '$BackgroundColor';/' -e 's/bg3:.*/bg3: '$AccentColor';/' -e 's/text:.*/text: '$TextColor';/' ~/.config/rofi/colour.rasi
	#change the colors for rofi

	sed -i -e 's/Accent .*/Accent '$AccentColor';/' -e 's/Background .*/Background '$BackgroundColor';/' ~/colour.css
	#change the texts and background color fpr wlogout

	for file in .config/wlogout/icons/*
	do
		sed -i 's/style="fill:.*"/style="fill:'$AccentColor'"/g' "$file"
	done
	#change the icons colors for wlogout
	
	sed -i -e 's/foreground\t.*/foreground\t'$TextColor'/' -e 's/background\t.*/background\t'$BackgroundColor'/' -e 's/color4\t.*/color4\t'$AccentColor'/' -e 's/color2\t.*/color2\t'$AccentColor'/' ~/.config/kitty/kitty.conf
	#change the colors for kitty

	plasma-apply-colorscheme $KDEColors	
	plasma-apply-wallpaperimage "$WallpaperPath/$SelectedTheme"
else
	echo "Selection Cancelled"
fi
