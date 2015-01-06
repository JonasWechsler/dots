sudo apt-get install -y beep xscreensaver conky feh terminator
sudo apt-get install i3

sudo modprobe pcspkr

wget http://github.com/downloads/djmelik/archey/archey-0.2.8.deb
sudo dpkg -i archey-0.2.8.deb

cp -ir i3 ~/.i3/
cp -i Pictures/* ~/Pictures/
cp -ir terminator/* ~/.config/terminator/
cp -i vimrc ~/.vimrc
