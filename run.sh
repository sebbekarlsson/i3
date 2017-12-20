cd ~/

# Update
sudo pacman -Syuu

# Install base packages
yes | sudo pacman -S xorg-xinit xorg-xrandr
yes | sudo pacman -S gvim chromium gnome-control-center termite dmenu
yes | sudo pacman -S python-pip python2-pip
yes | sudo pacman -S rofi
yes | sudo pacman -S git
yes | sudo pacman -S xbindkeys
yes | sudo pacman -S alsa-utils
yes | sudo pacman -S ttf-font-awesome
yes | sudo pacman -S i3lock imagemagick

# python linter
sudo pip install flake8

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
yes | yaourt ttf-material-icons

# Set terminal config
cp .Xresources ~/.

# set polybar config
cp -r polybar ~/.config/.

# Set locale
echo 'export LC_ALL=en_US.utf-8' >> ~/.bashrc
echo 'export LANG="$LC_ALL"' >> ~/.bashrc

# Set i3status config
cp ./i3status.conf ~/.
