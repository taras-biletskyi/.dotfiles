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

### CPU temp throttling ###
sudo tee /etc/systemd/system/prochot_fix.service <<'EOF'
[Unit]
Description=Set PROCHOT offset to 3°C (97°C trip point)
After=multi-user.target

[Service]
Type=oneshot
# Wait 5 seconds for EC to initialize, then apply MSR write
ExecStart=/bin/bash -c "sleep 5 && /usr/bin/wrmsr -a 0x1a2 0x3000000"
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
sudo systemctl daemon-reload
sudo systemctl enable --now prochot_fix.service

# Verify:
sudo rdmsr -f 29:24 -d 0x1a2  # Should return "3" (97°C trip)

### hyprpanel ###
# to reliably track CPU temp
ln -sfvn "$(find /sys/devices/platform/coretemp.0/hwmon/hwmon*/ -name "temp1_input")" /home/taras/.config/hyprpanel/avg_cpu_temp
