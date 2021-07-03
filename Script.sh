#!/usr/bin/sh
echo "Are you using Arch or an Arch-Based Distro (y or n?)"
read -r answer1
if [ "$answer1" = "y" ]
then
  echo "Which WM would you like?"
  echo "1) Dwm"
  echo "2) Bspwm"
  read -r wm
  if [ "$wm" = "1" ]
  then
    sudo pacman -S --noconfirm picom xorg-server xorg-xinit xorg-xsetroot base-devel fish pkgfile inetutils rust rofi
    mkdir ~/Installed-By-Script
    git clone https://aur.archlinux.org/paru-bin.git ~/Installed-By-Script/paru
    cd ~/Installed-By-Script/paru/ || exit
    makepkg -si
    paru -S --noconfirm librewolf-bin
    paru -S --noconfirm ttf-meslo-nerd-font-powerlevel10k
    cd ~/My-Github-Repository/.Dwm/dwm-6.2 || exit
    sudo make clean install
    cd .. 
    cd dmenu-5.0 || exit
    sudo make clean install
    cd .. 
    cd st-0.8.4 || exit
    sudo make clean install
    cd ..
    cd .. 
    cp .xinitrc ~/
    cd ~/ || exit
    echo "##############################################################################################
          ## Done! To use a windows manager uncomment the type of window manager you want in ~.xinitrc##
          ##############################################################################################"
  elif [ "$wm" = "2" ]
  then 
    sudo pacman -S --noconfirm picom xorg-server xorg-xinit xorg-xsetroot fish pkgfile inetutils rofi bspwm sxhkd alsa-utils
    mkdir ~/Installed-By-Script
    git clone https://aur.archlinux.org/paru-bin.git ~/Installed-By-Script/paru
    cd ~/Installed-By-Script/paru/ || exit
    makepkg -si
    paru -S --noconfirm librewolf-bin
    paru -S --noconfirm polybar
    paru -S --noconfirm ttf-meslo-nerd-font-powerlevel10k
    paru -S --noconfirm librewolf-bin
    cd ~/My-Github-Repository/.Dwm/dwm-6.2 || exit
    sudo make clean install
    cd .. 
    cd dmenu-5.0 || exit
    sudo make clean install
    cd .. 
    cd st-0.8.4 || exit
    sudo make clean install
    cd ..
    cd .. 
    cp .xinitrc ~/
    cd ~/My-Github-Repository/.rofi || exit
    mkdir ~/.config/rofi
    cp config.rasi ~/.config/rofi
    cp colors.rasi ~/.config/rofi
    cp font.rasi ~/.config/rofi
    cp launcher.rasi ~/.config/rofi
    cp mpd.rasi ~/.config/rofi
    cp network.rasi ~/.config/rofi
    cp networkmenu.rasi ~/.config/rofi
    cp powermenu.rasi ~/.config/rofi
    cp screenshot.rasi ~/.config/rofi
    mkdir ~/.config/bspwm
    mkdir ~/.config/sxhkd
    mkdir ~/.config/polybar
    cp ~/My-Github-Repository/.polybar/config ~/.config/polybar/
    cp ~/My-Github-Repository/.polybar/lb.sh ~/.config/polybar/
    cp ~/My-Github-Repository/.bspwm/bspwmrc ~/.config/bspwm/
    cp ~/My-Github-Repository/.sxhkd/sxhkdrc ~/.config/sxhkd/
    echo "##############################################################################################
          ## Done! To use a windows manager uncomment the type of window manager you want in ~.xinitrc##
          ##############################################################################################"

  fi;
fi 
