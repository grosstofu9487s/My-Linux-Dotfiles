#!/usr/bin/env bash
WallpaperPath="/home/$USER/wallpaper"
SelectedTheme=$(ls "$WallpaperPath" | rofi -dmenu -p)

if [ -f "$WallpaperPath/$SelectedTheme" ]; then	
	echo "Current selected wallpaper: $WallpaperPath/$SelectedTheme"
        pkill waybar

	awww img "$WallpaperPath/$SelectedTheme" --transition-type grow --transition-pos top-left

	AccentColor=$(jq '."'"$SelectedTheme"'"."accent-color"' theme_colour.json --raw-output)
	BackgroundColor=$(jq '."'"$SelectedTheme"'"."background-color"' theme_colour.json --raw-output)
        TextColor=$(jq '."'"$SelectedTheme"'"."text-color"' theme_colour.json --raw-output)
	
	sed -i -e 's/bg0:.*/bg0: '$BackgroundColor'F2;/' -e 's/bg1:.*/bg1: '$BackgroundColor';/' -e 's/bg3:.*/bg3: '$AccentColor';/' -e 's/text:.*/text: '$TextColor';/' ~/.config/rofi/colour.rasi
	sed -i -e 's/Accent .*/Accent '$AccentColor';/' -e 's/Background .*/Background '$BackgroundColor';/' ~/colour.css	
	sed -i -e 's/colors.active_border = .*/colors.active_border = "'$AccentColor'"/' -e 's/colors.inactive_border = .*/colors.inactive_border = "'$BackgroundColor'"/' ~/.config/hypr/colours.lua

	for file in .config/wlogout/icons/*
	do
		sed -i 's/style="fill:.*"/style="fill:'$AccentColor'"/g' "$file"
	done
	
	sed -i -e 's/foreground\t.*/foreground\t'$TextColor'/' -e 's/background\t.*/background\t'$BackgroundColor'/' -e 's/color4\t.*/color4\t'$AccentColor'/' -e 's/color2\t.*/color2\t'$AccentColor'/' ~/.config/kitty/kitty.conf
	waybar &
else
	echo "Selection Cancelled"
fi
