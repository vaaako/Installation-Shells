sudo apt-get install unzip

# Install neovim
# Get latest version
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

# Move to bin
./nvim.appimage --appimage-extract
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

# Remove image file
rm nvim.appimage

# Install font
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip

unzip JetBrainsMono.zip -d JetBrainsMono/
sudo cp -r JetBrains\ Mono\ Regular\ Nerd\ Font\ Complete.ttf ~/.local/share/fonts
rm JetBrainsMono.zip

# Nvchad
# Backuping
mkdir NeoVim-Previous-Config-Backup/
cp -r ~/.local/share/nvim NeoVim-Previous-Config-Backup/local/share/nvim/
cp -r ~/.local/share/nvim NeoVim-Previous-Config-Backup/config/nvim/

rm -rf ~/.local/share/nvim ~/.config/nvim
mkdir ~/.config/nvim

# Install
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1


