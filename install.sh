
#!/bin/bash

title="rao script"

downloadDependencies() {
    if grep "Arch\|Artix\|EndeavourOS\|Manjaro" /etc/*-release; then
        clear 
        echo "[*] Running an system update..."
        sudo pacman --noconfirm -Syu

        mkdir -p $HOME/.setup-scripto
        sleep 0.5
        clear

        if [[ -e /usr/bin/paru ]]; then
            echo -e "[*] paru detected. Installing dependencies..."
            paru -S bspwm sxhkd rofi polybar neovim-nightly-bin alacritty dunst picom brightnessctl playerctl dunst hsetroot maim viewnior jq xclip bsp-layout zsh
        elif [[ -e /usr/bin/yay ]]; then
            echo -e "[*] yay detected. Installing dependencies..."
            yay -S bspwm sxhkd rofi polybar neovim-nightly-bin alacritty dunst picom brightnessctl playerctl dunst hsetroot maim viewnior jq xclip bsp-layout zsh
        else
            read -r -p "Would you like to install yay? [Y/n]: " yay
            sleep 1.5

            case $yay in
                [yY][*])
                    git clone https://aur.archlinux.org/yay.git $HOME/.setup-scripto
                    (cd $HOME/.setup-scripto && makepkg -si)

                    echo "[*] yay installed. Installing dependencies..."
                    yay -S bspwm sxhkd rofi polybar neovim-nightly-bin alacritty picom brightnessctl playerctl dunst hsetroot maim viewnior jq xclip bsp-layout zsh
                    ;;
                [nN])
                    echo "[*] Okay. Will not install yay."
                    ;;
            esac 
        fi

        sleep 1
    else
        clear
        echo "[*] Not on a Arch based system. Failed to download dependencies. Please manually install it."

        sleep 1
    fi
}

copySimbolycLinks(){
    DIR_CONF=$(pwd)
    clear 
    
    sleep 1
    echo "[*] Generate symbolic links..."

    if [[ -d $HOME/.config/alacritty ]]; then
        mkdir $HOME/.config/alacritty.bak && mv $HOME/.config/alacritty/* $HOME/.config/alacritty.bak
        ln -sf $DIF_CONF/cfg/alacritty $HOME/.config/
    else
        ln -sf $DIR_CONF/cfg/alacritty $HOME/.config/
    fi

    echo "[*] Copied alacritty configuration!"
    sleep 0.7

    if [[ -d $HOME/.config/bspwm ]]; then
        mkdir $HOME/.config/bspwm.bak && mv $HOME/.config/bspwm/* $HOME/.config/bspwm.bak
        ln -sf $DIR_CONF/cfg/bspwm $HOME/.config/
    else
        ln -sf $DIR_CONF/cfg/bspwm $HOME/.config/
    fi

    echo "[*] Copied bspwm configuration!"
    sleep 0.7

    if [[ -d $HOME/.config/dunst ]]; then
        mkdir $HOME/.config/dunst.bak && mv $HOME/.config/dunst/* $HOME/.config/dunst.bak
        ln -sf $DIR_CONF/cfg/dunst $HOME/.config/
    else
        ln -sf $DIR_CONF/cfg/dunst $HOME/.config/
    fi

    echo "[*] Copied dunst configuration!"
    sleep 0.7

    if [[ -d $HOME/.config/eww ]]; then
        mkdir $HOME/.config/eww.bak && mv $HOME/.config/eww/* $HOME/.config/eww.bak
        ln -sf $DIR_CONF/cfg/eww $HOME/.config/
    else
        ln -sf $DIR_CONF/cfg/eww $HOME/.config/
    fi

    echo "[*] Copied eww configuration!"
    sleep 0.7

    if [[ -d $HOME/.config/nvim ]]; then
        mkdir $HOME/.config/nvim.bak && mv $HOME/.config/nvim/* $HOME/.config/nvim.bak
        ln -sf $DIR_CONF/cfg/nvim $HOME/.config/
    else
        ln -sf $DIR_CONF/cfg/nvim $HOME/.config/
    fi

    echo "[*] Copied nvim configuration!"
    sleep 0.7

    if [[ -d $HOME/.config/picom ]]; then
        mkdir $HOME/.config/picom.bak && mv $HOME/.config/picom/* $HOME/.config/picom.bak
        ln -sf $DIR_CONF/cfg/picom $HOME/.config/
    else
        ln -sf $DIR_CONF/cfg/picom $HOME/.config/
    fi

    echo "[*] Copied picom configuration!"
    sleep 0.7

    if [[ -d $HOME/.config/polybar ]]; then
        mkdir $HOME/.config/polybar.bak && mv $HOME/.config/polybar/* $HOME/.config/polybar.bak
        ln -sf $DIR_CONF/cfg/polybar $HOME/.config/
    else
        ln -sf $DIR_CONF/cfg/polybar $HOME/.config/
    fi

    echo "[*] Copied polybar configuration!"
    sleep 0.7

    if [[ -d $HOME/.config/starship ]]; then
        mkdir $HOME/.config/starship.bak && mv $HOME/.config/starship/* $HOME/.config/starship.bak
        ln -sf $DIR_CONF/cfg/starship $HOME/.config/
    else
        ln -sf $DIR_CONF/cfg/starship $HOME/.config/
    fi

    echo "[*] Copied starship configuration!"
    sleep 0.7

    if [[ -d $HOME/.config/sxhkd ]]; then
        mkdir $HOME/.config/sxhkd.bak && mv $HOME/.config/sxhkd/* $HOME/.config/sxhkd.bak
        ln -sf $DIR_CONF/cfg/sxhkd $HOME/.config/
    else
        ln -sf $DIR_CONF/cfg/sxhkd $HOME/.config/
    fi

    echo "[*] Copied sxhkd configuration!"
    sleep 0.7

    if [[ -d $HOME/.config/rofi ]]; then
        mkdir $HOME/.config/rofi.bak && mv $HOME/.config/rofi/* $HOME/.config/rofi.bak
        ln -sf $DIR_CONF/cfg/rofi $HOME/.config/
    else
        ln -sf $DIR_CONF/cfg/rofi $HOME/.config/
    fi

    echo "[*] Copied rofi configuration!"
    sleep 0.7

    if [[ -d $HOME/.local/bin ]]; then
        cp -r ./bin/* $HOME/.local/bin
    else
        mkdir $HOME/.local/bin && cp -r ./bin/* $HOME/.local/bin
    fi

    if [ -d $HOME/.local/share/fonts ]; then
        cp -r ./etc/fonts/* $HOME/.local/share/fonts
    else
        mkdir $HOME/.local/share/fonts && cp -r ./etc/fonts/* $HOME/.local/share/fonts
    fi

    if [ -d $HOME/Pictures/Wallpapers ]; then
        cp -r ./etc/walls/Stars.png $HOME/Pictures/Wallpapers 
    else 
        mkdir $HOME/Pictures/Wallpapers && cp -r ./etc/walls/gruv.png $HOME/Pictures/Wallpapers
    fi

    echo "[*] Copied binaries, fonts and wallpapers successfully!"

    sleep 0.7
    echo "[*] Copied files successfully."
    sleep 1.3


}

finalizeChanges() {
    clear
    echo "[*] Refreshing font cache..."
    fc-cache -v

    clear
    sleep 1.3

    clear
    echo "[*] Finalizing changes..."
    sleep 3
    clear
}

fuckUser() {
    clear
    echo "[*] An error occured. Exiting."
    exit
}

welcome() {
    whiptail --title "$title" \
        --no-button "Exit" --yes-button "Continue" \
        --yesno "This process will download the needed dependencies and copy the config files to $HOME/.config. Would you like to continue?" 10 70
    }

success() {
    # Remove the custom directory made by the script
    rm -rf $HOME/.setup-scripto

    whiptail --title "$title" \
        --msgbox "Setup success. Please restart BSPWM if you are on an active session. Check notes on the repository's README." 20 50
    }

installOutherModules(){
    #install oh my zsh
    if [[ -e /usr/bin/zsh ]]; then
        sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        rm $HOME/.zshrc
        ln -sf $DIR_CONF/.zshrc $HOME/
    fi
        #install plug vim 
    if [[ -e /usr/bin/nvim ]]; then
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    elif [[ -e /usr/bin/vim ]]; then
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        read -r -p "Would you like install nvim? [Y/n]: " nvim
        sleep 1.5

        case $nvim in
            [yY][*])
                yay -S nvim
                ;;
            [nN])
                echo "[*] Okay. Will not install nvim."
                ;;
        esac
    fi
}

echo "[*] Starting setup script..."
sleep 0.5

# Prompt user the welcome dialog
welcome || fuckUser

# Download dependencies
downloadDependencies

# Install outher modules
installOutherModules

# Copy files from the repo to $HOME/.config
#copyFiles
copySimbolycLinks

# Restart everything lol
finalizeChanges

# Show the success dialog when everything is fine
success && clear
