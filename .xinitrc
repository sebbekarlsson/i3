if [ -f ~/.Xmodmap ]; then
	xmodmap ~/.Xmodmap
fi

#feh --bg-fill /home/ianertson/Pictures/bg.png -F
/usr/bin/xrdb -merge /home/ianertson/.Xresources
exec /usr/bin/i3
