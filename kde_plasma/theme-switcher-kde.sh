#!/usr/bin/env bash
WallpaperPath=~/wallpaper
SelectedTheme=$(ls "$WallpaperPath" | rofi -dmenu -p)

if [ -f "$WallpaperPath/$SelectedTheme" ]; then	
	if [ "$SelectedTheme" == "No Color-Tint" ]; then
		CurrentColors=~/.local/share/color-schemes/$(kreadconfig6 --file ~/.config/kdeglobals --group "General" --key "ColorScheme").colors
		AccentColor=$(kreadconfig6 --file "$CurrentColors" --group "Colors:Window" --key "DecorationFocus")
		TextColor=$(kreadconfig6 --file "$CurrentColors" --group "Colors:Window" --key "ForegroundNormal")

		sed -i -e 's/DecorationFocus=.*/DecorationFocus='$AccentColor'/g' -e 's/DecorationHover=.*/DecorationHover='$AccentColor'/g' -e 's/ForegroundNormal=.*/ForegroundNormal='$TextColor'/g' ~/.local/share/color-schemes/NoColorTint.colors

		kwriteconfig6 --file ~/.local/share/color-schemes/NoColorTint.colors --group "Colors:Selection" --key "BackgroundNormal" "$AccentColor"
		kwriteconfig6 --file ~/.local/share/color-schemes/NoColorTint.colors --group "Colors:Selection" --key "ForegroundActive" "$AccentColor"
		kwriteconfig6 --file ~/.local/share/color-schemes/NoColorTint.colors --group "Colors:Header" --key "BackgroundNormal" "$AccentColor"

		plasma-apply-colorscheme "NoColorTint"
	else
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
	fi

else
	echo "Selection Cancelled"
fi
