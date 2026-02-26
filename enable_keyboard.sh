cat << 'EOF' > ~/enable_keyboard
#!/usr/bin/bash
xinput enable "AT Translated Set 2 keyboard"
xinput enable "SynPS/2 Synaptics TouchPad"
echo "Internal inputs re-enabled."
EOF
chmod +x ~/enable_keyboard
