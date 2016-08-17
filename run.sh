cd ~/

# Update
sudo pacman -Syuu

# Install base packages
yes | sudo pacman -S xorg-xinit xorg-xrandr
yes | sudo pacman -S gvim chromium gnome-control-center xfce4-terminal
yes | sudo pacman -S git

# Install vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install yaourt
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ..

# Install i3-gaps
yes | yaourt i3-gaps
yes | sudo pacman -S i3status feh

# Set xfce4-terminal config
cp ./terminalrc ~/.config/xfce4/terminal/terminalrc

echo 'export LC_ALL=en_US.utf-8' >> ~/.bashrc
echo 'export LANG="$LC_ALL"' >> ~/.bashrc
