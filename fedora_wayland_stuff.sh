# INFO: THIS IS STILL VERY WIP!

# Put ~/.local/bin in path for GUI (and neovim) apps
mkdir -p ~/.config/environment.d
echo "PATH=$HOME/.local/bin:$PATH" >> ~/.config/environment.d/00-user-path.conf
systemctl --user import-environment PATH

### Kmonad ###
# TODO:
# install Kmonad binary or compiler from source and place it in /usr/local/bin
sudo bash -c 'cat > /etc/systemd/system/kmonad.service <<EOF
[Unit]
Description=KMonad Keyboard Remapper
After=suspend.target

[Service]
ExecStart=/usr/local/bin/kmonad /home/taras/.config/kmonad/config.kbd
Restart=always
User=$USER
StandardOutput=append:/var/log/kmonad.log
StandardError=append:/var/log/kmonad.log

[Install]
WantedBy=default.target
EOF
sudo chmod +x /usr/local/bin/kmonad
systemctl daemon-reload && systemctl enable --now kmonad'

# Create a SELinux policy to allow kmonad to run
sudo ausearch -m AVC,USER_AVC -c "kmonad" --raw | audit2allow -M kmonad_policy
sudo semodule -i kmonad_policy.pp
sudo systemctl restart kmonad


### tmux ###
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
