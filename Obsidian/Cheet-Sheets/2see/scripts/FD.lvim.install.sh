sudo dnf copr enable atim/lazygit -y
sudo dnf install git make cargo nodejs lazygit python3-pip neovim ruby cpanminus ruby-devel -y
sudo mkdir -p /usr/share/X11/fonts/
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH
source ~/.bashrc
sudo cpanm Neovim::Ext
sudo gem install neovim
gem environment
sudo cpanm --local-lib=~/perl5 local::lib && eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
lvim +LvimUpdate +q
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf
fc-cache -f -v
chmod +x ~/.local/bin/lvim

