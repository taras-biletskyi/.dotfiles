# Put ~/.local/bin in path for GUI (and neovim) apps
mkdir -p ~/.config/environment.d
echo "PATH=$HOME/.local/bin:$PATH" >> ~/.config/environment.d/00-user-path.conf
systemctl --user import-environment PATH
