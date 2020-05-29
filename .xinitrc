xrdb -merge /home/ianertson/.Xresources
feh --bg-fill /home/ianertson/bg.jpg -F
xset r rate 300 50
compton --daemon --config /home/ianertson/.config/compton.conf

exec i3
