xrdb -merge $HOME/.Xresources
#feh --bg-fill $HOME/bg.jpg -F
xset r rate 300 50
#compton --daemon --config $HOME/.config/compton.conf
#xrandr --output eDP-1 --mode 1920x1080
xrandr --output DP-0 --primary
# NVIDIA GL vsync follows HDMI-0's vblank otherwise -> tearing on the main monitor
export __GL_SYNC_DISPLAY_DEVICE=DP-0

#dbus-update-activation-environment --systemd DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP=i3
exec i3
