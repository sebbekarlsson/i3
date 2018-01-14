sudo systemctl enable bumblebeed
sudo usermod -a -G bumblebee $USER
sudo systemctl restart bumblebeed

echo "Logout and login, and you will be all set!"
