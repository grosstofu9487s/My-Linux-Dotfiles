git clone https://github.com/psudo-dev/psudofont-liga-mono.git
cp -r "psudofont-liga-mono/psudoFont Liga Mono" ~/.local/share/fonts/
fc-cache -v
sed -i "s/\/home\/USER\//\/home\/$USER\//g" hyprland_config/.config/waybar/style.css hyprland_config/.config/wlogout/style.css
for file in ./*
do
	if [ $file = ".config"]; then
		for config in $file/*
		do
			cp -r $config ~/.config/
		done
	elif [ $file = "setup.sh" ]; then
		continue
	else
		cp -r $file ~/
	fi
done
