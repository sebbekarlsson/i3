xrdb -merge $HOME/.Xresources
feh --bg-fill $HOME/bg.jpg -F
xset r rate 300 50
compton --daemon --config $HOME/.config/compton.conf
xrandr --output eDP-1 --mode 1920x1080

exec i3
