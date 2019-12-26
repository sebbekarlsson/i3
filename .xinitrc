xrdb -merge /home/ianertson/.Xresources
feh --bg-fill /home/ianertson/bg.jpg -F
compton --daemon --config /home/ianertson/.config/compton.conf

exec i3
