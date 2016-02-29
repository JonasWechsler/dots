#apt-get install ruby-ronn
#git clone git://github.com/vivien/i3blocks
#cd i3blocks
#make clean
#make install

#git clone https://github.com/Airblader/i3.git
#For gaps
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

pip install --user py3status
#Installs at $HOME/.local/bin/py3status

mkdir $HOME/.local/share/fonts
cp fontawesome-webfont.ttf $HOME/.fonts
cp fontawesome-webfont.ttf $HOME/.local/share/fonts
fc-cache -f -v

rm -rv ~/.i3/*
cp -rv i3/* $HOME/.i3/
cp -v Pictures/* $HOME/Pictures/
cp -v vimrc $HOME/.vimrc
cp -v xinitrc $HOME/.xinitrc
cp -v Xresources $HOME/.Xresources
cp -v zshrc $HOME/.zshrc

zsh setupzsh.sh

