# Color vars
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color


echo -e "\n\n\n${YELLOW}[${RED}*${YELLOW}] Installing neovim latest version ...${NC}"
wget "https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz" -O /tmp/nvim-linux64.tar.gz
mkdir -p ~/.local/
tar xf /tmp/nvim-linux64.tar.gz -C ~/.local
ln -sf $(readlink -f ~/.local/nvim-linux64/bin/nvim) ~/.local/bin/nvim

# Add ~/.local/bin to PATH if it's not already in it
if ! [[ ":$PATH:" == *":$HOME/.local/bin:"* ]]; then
	echo -e "\n\n\n${YELLOW}[${RED}*${YELLOW}] Adding ~/.local/bin to PATH${NC}"
	if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
		SHELL_CONFIG_FILE=~/.zshrc
	elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
		SHELL_CONFIG_FILE=~/.profile
	else
		echo -e "\n\n\n${YELLOW}[${RED}-${YELLOW}] Could not detect what shell you are using. Ensure to manually add ~/.local/bin to your PATH${NC}"
	fi
	echo -e '\nPATH="$HOME/.local/bin:$PATH"' >> $SHELL_CONFIG_FILE
	export PATH="$HOME/.local/bin:$PATH"
fi

